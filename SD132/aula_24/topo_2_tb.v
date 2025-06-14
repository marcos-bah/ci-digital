module topo_2_tb;

    reg [3:0] inA, inB;
    reg clk, rst, operacao;
    wire [5:0] resultado;

    topo_2 uut (
        .inA(inA),
        .inB(inB),
        .clk(clk),
        .rst(rst),
        .operacao(operacao),
        .resultado(resultado)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        inA = 4'b0000;
        inB = 4'b0000;
        operacao = 0;

        #10;
        rst = 0;
        //desloca 3
        inA = 4'b0001;
        inB = 4'b0011;
        operacao = 0;
        #100;

        rst = 1;
        #10;
        rst = 0;

        //desloca 2
        inA = 4'b0101;
        inB = 4'b0010;
        operacao = 0;
        #100;

        rst = 1;
        #10;
        rst = 0;

        $finish;
    end

endmodule
