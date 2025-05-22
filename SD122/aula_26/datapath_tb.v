module datapath_tb;
    reg [3:0] dados;
    reg sel21, sel12, clk;
    reg [2:0] operacao;
    wire [3:0] resultado;
    wire carry_out;

    datapath uut (
        .dados(dados),
        .sel21(sel21),
        .sel12(sel12),
        .clk(clk),
        .operacao(operacao),
        .resultado(resultado),
        .carry_out(carry_out)
    );

    initial begin
        $display("\n");
        $monitor("Tempo=%0t | resultado=%b carry=%b", $time, resultado, carry_out);

        dados = 4'b0011;
        sel21 = 0; //Dados de entrada alimentando o register
        sel12 = 0; //Saída vai em A
        operacao = 3'b010; //Soma
        clk = 0; 
    end
    
    always #10 clk = ~clk;

    initial #100 $stop;
endmodule

