module sistema_mem_02_tb;

    reg clk, we;
    reg [15:0] addr;
    reg [7:0] din;
    wire [7:0] dout;
    wire [3:0] cs;

    sistema_mem_02 uut (
        .clk(clk),
        .we(we),
        .addr(addr),
        .din(din),
        .dout(dout),
        .cs(cs)
    );

    initial begin
        $display("\nTestbench: Sistema de Memória com Decodificador 4 Faixas");

        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        we = 0; din = 8'h00; addr = 16'h0000;
        #10;

        // Escrita válida (1 faixa)
        we = 1; din = 8'hAA; addr = 16'h0400;
        #10; we = 0;
        #10;

        // Leitura válida
        addr = 16'h0400;
        #10;

        // Escrita válida (3 faixa)
        we = 1; din = 8'hBB; addr = 16'h0C00;
        #10; we = 0;
        #10;

        // Leitura válida
        addr = 16'h0C00;
        #10;

        // Fora de Faixa (inferior)
        we = 1; din = 8'hCC; addr = 16'h0000;
        #10; we = 0;
        #10;

        // Fora de Faixa (superior)
        we = 1; din = 8'hDD; addr = 16'h8001;
        #10; we = 0;
        #10;

        $stop;
    end

endmodule
