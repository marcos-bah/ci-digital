`timescale 1ns/1ps

module tb_spi_master;

    // Parametros do sistema
    parameter integer CLK_FREQ = 50000000;  // 50 MHz clock do sistema
    parameter integer SCLK_FREQ = 1000000;  // 1 MHz clock SPI

    // Sinais do testbench
    reg clk;                // Clock do sistema
    reg reset;              // Reset do sistema
    reg [7:0] data_in;      // Dados de entrada para transmissao
    reg start;              // Sinal de inicio
    reg CPOL;               // Polaridade do clock
    reg CPHA;               // Fase do clock
    reg MISO;               // Master Input, Slave Output
    wire SCLK;              // Clock SPI gerado
    wire MOSI;              // Master Output, Slave Input
    wire CS;                // Slave Select
    wire busy;              // Indica se a transmissao esta ativa
    wire [7:0] data_out;    // Dados recebidos do escravo

    // Instancia do SPI Master
    spi_master #(
        .CLK_FREQ(CLK_FREQ), 
        .SCLK_FREQ(SCLK_FREQ)
    ) uut (
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .start(start),
        .CPOL(CPOL),
        .CPHA(CPHA),
        .MISO(MISO),
        .SCLK(SCLK),
        .MOSI(MOSI),
        .CS(CS),
        .busy(busy),
        .data_out(data_out)
    );
	 
    reg [7:0] data_slave, data_slave2;
    reg [7:0] data_master;
    reg [2:0] i;

    // Clock do sistema: gera 50 MHz
    initial clk = 0;
    always #10 clk = ~clk;

    // Teste
    initial begin
        // Inicializacao
        reset = 1;
        i = 0;
        start = 0;
        CPOL = 0;
        CPHA = 0;
	    MISO = 0;

        // Libera o reset
        #20 reset = 0;
		  
	for (i = 0; i <= 3; i = i + 1)
	begin

        data_in = $random & 8'hFF;  // Dado de entrada
	    data_slave = $random & 8'hFF; // Dado enviado pelo escravo (simulado)
	    data_slave2 = data_slave;
	    data_master = 8'b00000000; // Dado a ser enviado pelo mestre
		  
	    CPOL = i[1];
        CPHA = i[0];
	    MISO = 0;
				
        #20;
	    $display("+----------------------------+");
        $display("|Teste %d: CPOL = %d, CPHA = %d |", i, i[1], i[0]);
	    $display("+----------------------------+");
	    if (i == 0) $display("Mudanca de dado na borda de descida de SCLK (e CS 0), e amostragem na borda de subida de SCLK");
	    if (i == 1) $display("Mudanca de dado na borda de subida de SCLK, e amostragem na borda de descida de SCLK");
	    if (i == 2) $display("Mudanca de dado na borda de subida de SCLK (e CS 0), e amostragem na borda de descida de SCLK");
	    if (i == 3) $display("Mudanca de dado na borda de descida de SCLK, e amostragem na borda de subida de SCLK");
   
        start = 1;
        #20 start = 0;
  
        // Aguarda o termino da transmissao
        #80; wait (!busy);
        #40;
	    $display("Time: %0t. Dado que o mestre deve enviar: %b (%h)", $time, data_in, data_in);
	    $display("Time: %0t. Dado na saida MOSI: %b (%h)", $time, data_master, data_master);
	    $display("Time: %0t. Dado que o escravo deve enviar: %b (%h)", $time, data_slave2, data_slave2);
        $display("Time: %0t. Dado recebido na entrada MISO : %b (%h) \n\n", $time, data_out, data_out);
	    #1000;
	end
		  
	$stop;

    end

    // simula a amostragem e mudanca de bit dependendo de CPHA e CPOL	 
    always @(posedge SCLK or negedge SCLK) begin
        if (uut.current_state == 2) begin
            if (!CPHA) begin
                if (!CPOL) begin 
		            if (SCLK === 1'b1) begin
		                MISO <= data_slave[7];
		            end else begin
		                data_slave <= {data_slave[6:0], 1'b0};
		                data_master <= {data_master[6:0], MOSI};
		            end
		        end else begin
		            if (SCLK === 1'b0) begin
		                MISO <= data_slave[7];
		            end else begin
		                data_slave <= {data_slave[6:0], 1'b0};
		                data_master <= {data_master[6:0], MOSI};
		            end
                end
            end else
	            if (!CPOL) begin 
		            if (SCLK === 1'b0) begin
		                MISO <= data_slave[7];
		            end else begin
		                data_slave <= {data_slave[6:0], 1'b0};
		                data_master <= {data_master[6:0], MOSI};
		            end
		        end else begin
		            if (SCLK === 1'b1) begin
		                MISO <= data_slave[7];
		            end else begin
		                data_slave <= {data_slave[6:0], 1'b0};
		                data_master <= {data_master[6:0], MOSI};
		            end
                end
        end
    end
	 
endmodule
