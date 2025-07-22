`timescale 1ns/1ps

module tb_spi_slave;

    // Parametros do sistema
    parameter integer CLK_FREQ = 50000000;  // 50 MHz clock do sistema
    parameter integer SCLK_FREQ = 1000000;  // 1 MHz clock SPI

    // Sinais do testbench
    reg clk;                // Clock do sistema
    reg reset;              // Reset do sistema
    reg [7:0] data_in;      // Dados de entrada para transmissao
    reg CS;                 // Slave Select
    reg CPOL;               // Polaridade do clock
    reg CPHA;               // Fase do clock
    reg SCLK;               // Clock SPI gerado
    reg MOSI;               // Master Input, Slave Output
    wire MISO;              // Master Output, Slave Input
    wire busy;              // Indica se a transmissao esta ativa
    wire [7:0] data_out;    // Dados recebidos do escravo
	 
    // Instancia do SPI Master
    spi_slave uut (
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .CS(CS),
        .CPOL(CPOL),
        .CPHA(CPHA),
        .SCLK(SCLK),
	    .MOSI(MOSI),
        .MISO(MISO),
        .busy(busy),
        .data_out(data_out)
    );
	 
    reg [7:0] data_slave;
    reg [7:0] data_master, data_master2;
    reg [2:0] i;
	 
    integer clk_counter;
    integer CLK_DIV = CLK_FREQ / (2 * SCLK_FREQ) - 1;
	
    // Clock do sistema: gera 50 MHz
    initial clk = 0;
    always #10 clk = ~clk;
	 
    // Geracao do SCLK com base no divisor e CPOL
    always @(posedge clk or posedge reset or posedge CS) begin
        if (reset) begin
            SCLK <= CPOL;
            clk_counter <= 0;
        end else if (!CS) begin
            if (clk_counter == CLK_DIV) begin
                SCLK <= ~SCLK;      // Alterna o estado do SCLK
                clk_counter <= 0;   // Reinicia o contador
            end else begin
                clk_counter <= clk_counter + 1;
            end
        end else begin
		     SCLK <= CPOL;
		     clk_counter <= 0;
		  end
    end

    // Teste
    initial begin
        // Inicializacao
        reset = 1;
        CS = 1;
	    i = 0;
        CPOL = 0;
        CPHA = 0;
	    MOSI = 0;

        // Libera o reset
        #20 reset = 0;
	    #20;
		  
	    for (i = 0; i <= 3; i = i + 1)
	    begin

            data_in = $random & 8'hFF; // Dado de entrada
	        data_master = $random & 8'hFF; // Dado enviado pelo mestre (simulado)
	        data_master2 = data_master;
	        data_slave = 8'b00000000; // Dado a ser enviado pelo escravo
		      
	        CPOL = i[1];
            CPHA = i[0];
	        MOSI = 0;
	        # 100;
	        # 20 CS = 0;
				
	        $display("+----------------------------+");
            $display("|Teste %d: CPOL = %d, CPHA = %d |", i, i[1], i[0]);
	        $display("+----------------------------+");
	        if (i == 0) $display("Mudanca de dado na borda de descida de SCLK (e CS 0), e amostragem na borda de subida de SCLK");
	        if (i == 1) $display("Mudanca de dado na borda de subida de SCLK, e amostragem na borda de descida de SCLK");
	        if (i == 2) $display("Mudanca de dado na borda de subida de SCLK (e CS 0), e amostragem na borda de descida de SCLK");
	        if (i == 3) $display("Mudanca de dado na borda de descida de SCLK, e amostragem na borda de subida de SCLK");
   
            // Aguarda o termino da transmissao
            #80; wait (!busy);
            CS = 1;
	        #40;
	        $display("Time: %0t. Dado que o escravo deve enviar: %b (%h)", $time, data_in, data_in);
	        $display("Time: %0t. Dado na saida MISO: %b (%h)", $time, data_slave, data_slave);
	        $display("Time: %0t. Dado que o escravo deve enviar: %b (%h)", $time, data_master2, data_master2);
            $display("Time: %0t. Dado recebido na entrada MOSI : %b (%h) \n\n", $time, data_out, data_out);
	        #500;
	   end
		  
	   $stop;

    end
	
    // simula a amostragem e mudanca de bit dependendo de CPHA e CPOL
    always @(posedge SCLK or negedge SCLK) begin
        if (uut.current_state == 2) begin
            if (!CPHA) begin
                if (!CPOL) begin 
	                if (SCLK === 1'b1) begin
	                    MOSI <= data_master[7];
		            end else begin
		                data_master <= {data_master[6:0], 1'b0};
		                data_slave <= {data_slave[6:0], MISO};
		            end
		        end else begin
		            if (SCLK === 1'b0) begin
		                MOSI <= data_master[7];
		            end else begin
		                data_master <= {data_master[6:0], 1'b0};
		                data_slave <= {data_slave[6:0], MISO};
		            end
                end
	        end else
	            if (!CPOL) begin 
		            if (SCLK === 1'b0) begin
		                MOSI <= data_master[7];
		            end else begin
		                data_master <= {data_master[6:0], 1'b0};
		                data_slave <= {data_slave[6:0], MISO};
		            end
	            end else begin
		            if (SCLK === 1'b1) begin
			            MOSI <= data_master[7];
		            end else begin
		                data_master <= {data_master[6:0], 1'b0};
		                data_slave <= {data_slave[6:0], MISO};
		            end
                 end

        end
    end
	 
endmodule
