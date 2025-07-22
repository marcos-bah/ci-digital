module uart_rx #(
    parameter integer CLOCK_HZ = 50_000_000,     // Frequência do clock (Hz)
    parameter integer BAUD_RATE = 9600           // Baud rate desejado
)(
    input wire clk,
    input wire reset,
    input wire rx,
    output reg [7:0] data_out,
    output reg rx_done, paridade_error
);

    // Estados da maquina
    localparam IDLE = 3'b000, START = 3'b001, DATA = 3'b010, STOP = 3'b011, DONE = 3'b100, ERROR = 3'b101;
    localparam CLK_PER_BIT = CLOCK_HZ / BAUD_RATE;

    reg [2:0] state;
    reg [9:0] shift_reg; // 8 dados + 1 paridade + 1 stop
    reg [2:0] bit_counter;
    reg [15:0] clk_counter;
	reg enable_counter;
	reg enable_shift;
	reg load_data;

    reg [8:0] w_data_out;
    wire bit_error_paridade;

    verificador_paridade #(.DATA_WIDTH(8)) v (
        .data_in(w_data_out),
        .error(bit_error_paridade)
    );
	 
	// Contagem dos ciclos de clock
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            clk_counter <= 16'b0;
        end else if (enable_counter) begin
			if (clk_counter < CLK_PER_BIT - 1) begin
				clk_counter <= clk_counter + 1'b1;
			end else begin
				clk_counter <= 16'b0;
			end
        end else clk_counter <= 16'b0;
    end
	 
    // Registrador de deslocamento
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            shift_reg <= 10'b0;
			data_out <= 8'b0;
        end else if (enable_shift) begin
            shift_reg <= {rx, shift_reg[9:1]};
		end else if (load_data) begin
		    data_out <= shift_reg[8:1];
            w_data_out = shift_reg[9:1];
            $display("saida: %b paridade: %b", data_out, shift_reg);
		end
    end
	 
    // Logica sequencial para determinar o proximo estado
    always @(posedge clk or posedge reset) begin
	    if (reset) begin
		    state <= IDLE;
			bit_counter <= 3'b0;
		end else begin
            case (state)
                IDLE: begin
                    if (rx == 0) begin
                        state <= START; // Detecta o bit de inicio
                    end
                end

                START: begin
                    if (clk_counter == CLK_PER_BIT - 1) begin
                        state <= DATA;
                        bit_counter <= 0;
                    end
                end

                DATA: begin
                    if (bit_counter == 7) begin 
                        if (clk_counter == CLK_PER_BIT - 1) begin
                            state <= STOP; // Ultimo bit de dados recebido
                        end
                    end else if (clk_counter == CLK_PER_BIT - 1) begin
                        bit_counter <= bit_counter + 1'b1;
					end
                end

                STOP: begin
				    if (clk_counter == CLK_PER_BIT - 1) begin
                        if (shift_reg[8] == 1) begin // Verifica o bit de parada
                            state <= DONE;
                        end else begin
                            state <= ERROR; // Erro na recepcao no STOP bit
                        end
				    end
                end

                DONE: begin
                    if (clk_counter == CLK_PER_BIT - 1) state <= IDLE;
                end
				
			    ERROR: begin
			        if (clk_counter == CLK_PER_BIT - 1) state <= IDLE;
			    end

                default: begin
                    // Estado de seguranca
                    state <= IDLE;
                end

            endcase
		end
    end

    // Logica combinacional: Amostragem dos dados
    always @(*) begin
        rx_done = 0;
		enable_counter = 0;
		enable_shift = 0;
		load_data = 0;
        case (state)
            IDLE: begin
            end

            START: begin
			    enable_counter = 1;
            end

            DATA: begin
			    enable_counter = 1;
				enable_shift = (clk_counter == CLK_PER_BIT / 2);
				if ((bit_counter == 7) && (clk_counter == CLK_PER_BIT - 1)) begin
                    load_data = 1;
                end
            end

            STOP: begin
			    enable_counter = 1;
                enable_shift = (clk_counter == CLK_PER_BIT / 2);
            end

            DONE: begin
                enable_counter = 1;
                rx_done = 1;
                paridade_error = bit_error_paridade;
            end

			ERROR: begin
                enable_counter = 1;
                rx_done = 1;
            end
					 
			default: begin
            end
        endcase
    end

endmodule
