module sklansky_4_tb();
    reg [3:0] A, B;
    reg Cin;
    wire [3:0] Sum;
    wire Cout;

    reg [4:0] expected;

    sklansky_4 uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    integer i, j, k;
    integer errors = 0;

    initial begin
        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                for (k = 0; k < 2; k = k + 1) begin
                    A = i[3:0];
                    B = j[3:0];
                    Cin = k[0];
                    expected = A + B + Cin;
                    #1;  // Aguarda propagação de sinais

                    if ({Cout, Sum} !== expected) begin
                        $display("ERRO: A=%b, B=%b, Cin=%b => Esperado: S=%b, Cout=%b | Obtido: S=%b, Cout=%b",
                                 A, B, Cin, expected[3:0], expected[4], Sum, Cout);
                        errors = errors + 1;
                    end
                end
            end
        end

        if (errors == 0)
            $display("Todos os testes passaram com sucesso.");
        else
            $display("Total de erros: %d", errors);

        $finish;
    end
endmodule
