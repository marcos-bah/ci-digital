module sistema_mem_01_tb;

    reg clk, we;
    reg [15:0] addr;
    reg [7:0] din;
    wire [7:0] dout;
    wire cs;

    sistema_mem_01 uut (
        .clk(clk),
        .we(we),
        .addr(addr),
        .din(din),
        .dout(dout),
        .cs(cs)
    );

    initial begin
        $display("\nTestbench: Sistema de Memória com Decodificador");

        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        we = 0; din = 8'h00; addr = 16'h0000;
        #10;

        // Escrita válida (dentro da faixa)
        we = 1; din = 8'hAA; addr = 16'h0400;
        #10; we = 0;
        #10;

        // Leitura válida
        addr = 16'h0400;
        #10;

        // Escrita inválida (fora da faixa inferior)
        we = 1; din = 8'hBB; addr = 16'h0200;
        #10; we = 0;
        #10;

        // Leitura do endereço inválido (não deve mudar valor da memória)
        addr = 16'h0200;
        #10;

        // Leitura de outro endereço válido
        addr = 16'h0401;
        #10;

        $stop;
    end

endmodule
