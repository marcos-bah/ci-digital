module mem_01_tb;

    reg clk, cs, we_mem_in, we_resultado;
    reg [8:0] endereco_saida, enderecoA, enderecoB;
    reg [7:0] dado_in;
    reg [2:0] opcode;
    wire [7:0] sdadosA, sdadosB, s_ula, saida;

    mem_01 uut (
        .clk(clk), .cs(cs), .we_mem_in(we_mem_in), .we_resultado(we_resultado),
        .endereco_saida(endereco_saida), .enderecoA(enderecoA), .enderecoB(enderecoB),
        .dado_in(dado_in), .opcode(opcode),
        .sdadosA(sdadosA), .sdadosB(sdadosB), .s_ula(s_ula), .saida(saida)
    );

    initial begin
        $display("\nTestbench - mem_01");

        clk = 0;
        cs = 1;
        we_mem_in = 0;
        we_resultado = 0;
        enderecoA = 4'h08;
        enderecoB = 4'h09;
        endereco_saida = 4'h00;
        dado_in = 4'h04;
        opcode = 3'b000;

        #45;

        we_mem_in = 1;
        enderecoA = 4'h00;
        endereco_saida = 4'h01;

        #10;

        we_mem_in = 0;
        enderecoB = 4'h06;
        endereco_saida = 4'h02;

        #15;

        we_mem_in = 1;
        enderecoA = 4'h01;

        #10;

        we_mem_in = 0;
        enderecoB = 4'h05;
        endereco_saida = 4'h00;

        $stop;
    end

    always #5 clk = ~clk;

endmodule
