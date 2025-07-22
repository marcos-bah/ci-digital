module spi_slave (
    input wire clk,                // Clock do sistema
    input wire reset,              // Reset do sistema
    input wire [7:0] data_in,      // Dados a serem enviados
    input wire CS,                 // Slave Select
    input wire CPOL,               // Polaridade do clock (Clock Polarity)
    input wire CPHA,               // Fase do clock (Clock Phase)
    input wire SCLK,               // Clock SPI
    input wire MOSI,               // Master Output, Slave Input
    output reg MISO,               // Master Input, Slave Output 
    output reg busy,               // Indica que a transmissao esta em progresso
    output reg [7:0] data_out      // Dados recebidos do mestre
);

    // Definicao dos estados
    localparam IDLE = 2'b00;     // Estado ocioso
    localparam LOAD = 2'b01;     // Carregamento dos dados
    localparam TRANSFER = 2'b10; // Transferencia de dados
    localparam DONE = 2'b11;     // Finalizacao da transmissao

    reg [2:0] current_state, next_state;

    reg [7:0] shift_reg;           // Registrador de deslocamento para transmissao
    reg [7:0] rx_reg;              // Registrador de recepcao
    reg [3:0] bit_cnt;             // Contador de bits

    reg sclk_last;                 // Estado anterior de SCLK
	 
    wire edge_pos;                 // Detecta borda de subida
    wire edge_neg;                 // Detecta borda de descida
	 
    reg sample;                    // Condicao para amostrar dado
    reg shift;                     // Condicao para deslocar dado
	 
    reg load_data;                 // Carrega dados para transmissao
    reg shift_sample_data;         // Habilita o deslocamento do registrador
	 
    reg load_data_out;             // Carrega dados transmitidos pelo mestre
	 
    assign edge_pos = ~sclk_last & SCLK;
    assign edge_neg = sclk_last & ~SCLK;
	 
    // Sincronizacao de SCLK no clock do sistema
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            sclk_last <= CPOL;
        end else begin
            sclk_last <= SCLK;
        end
    end
	 
    always @(*) begin
        sample = (edge_pos && (CPOL == CPHA)) || (edge_neg && (CPOL != CPHA));
        shift  = (edge_neg && (CPOL == CPHA)) || (edge_pos && (CPOL != CPHA));
    end
	 
    always @(posedge sample or posedge reset) begin
        if (reset) begin
            MISO <= 0;
        end else if (shift_sample_data) begin
            MISO <= shift_reg[7];
        end
    end
	 
    always @(posedge shift or posedge reset) begin
        if (reset) begin
            bit_cnt <= 4'b0;
        end else if (shift_sample_data) begin
            bit_cnt <= bit_cnt + 1'b1;
        end else begin
	        bit_cnt <= 4'b0;
        end
    end
    
    always @(posedge shift or posedge load_data or posedge reset) begin
        if (reset) begin
            shift_reg <= 8'b0;
            rx_reg <= 8'b0;
        end else if (load_data) begin
            shift_reg <= data_in;
        end else if (shift_sample_data) begin
            shift_reg <= {shift_reg[6:0], 1'b0};
            rx_reg <= {rx_reg[6:0], MOSI};
        end
    end
	 
    // Apos a recepcao carrega os dados
    always @(posedge clk or posedge reset) begin
        if (reset) begin
	        data_out <= 8'b0;
	    end else if (load_data_out) begin
	        data_out <= rx_reg;
	    end
    end
	 
    // Logica sequencial: Transicao de estado
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= IDLE;
        end else begin
            current_state <= next_state;
        end
    end
	 
    // Logica combinacional para determinar o proximo estado
    always @(*) begin
        next_state = current_state; // Valor padrao: permanece no mesmo estado
        case (current_state)
            IDLE: if (!CS) next_state = LOAD;
				
            LOAD: if (!CPHA || (CPHA && (edge_pos || edge_neg))) next_state = TRANSFER;
					 
            TRANSFER: if (bit_cnt == 8) next_state = DONE;
				
            DONE: next_state = IDLE;
        endcase
    end
	 
    // Logica combinacional: Amostragem dos dados
    always @(*) begin
        if (reset) begin
	        busy = 0;
	        load_data = 0;
	        shift_sample_data = 0;
	        load_data_out = 0;
        end else begin
            case (current_state)
                IDLE: begin
                    busy = 0;
	                load_data = 0;
		            shift_sample_data = 0;
		            load_data_out = 0;
                end

                LOAD: begin
		            busy = 1;
		            shift_sample_data = 0;
		            load_data = (!CPHA || (CPHA && (edge_pos || edge_neg)));
		            load_data_out = 0;
                end

                TRANSFER: begin
		            busy = 1;
		            load_data = 0;
		            shift_sample_data = 1;
		            load_data_out = 0;
                end

                DONE: begin
                    busy = 0;
		            shift_sample_data = 0;
		            load_data = 0;
		            load_data_out = 1;
                end
					 
		        default: begin
                    busy = 0;
		            load_data = 0;
		            shift_sample_data = 0;
		            load_data_out = 0;
		        end
						  
            endcase
        end
    end

endmodule
