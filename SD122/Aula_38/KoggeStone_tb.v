module KoggeStone_tb ();
    reg [3:0] A, B;
    reg Cin;
    wire [3:0] Sum;
    wire Cout;
    reg [3:0] Expected;
    reg ExpectedCout;
    integer i, j;
    reg success;

    KoggeStone uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin
        success = 1;
        Cin = 0;
        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                A = i;
                B = j;
                {ExpectedCout, Expected} = i + j;
                #10;

                if ({Cout, Sum} !== {ExpectedCout, Expected}) begin
                    $display("Erro: A=%b | B=%b | Cin=%b ==> Cout=%b | Sum=%b Expected=%b", A, B, Cin, Cout, Sum, {ExpectedCout, Expected});
                    success = 0;
                end
            end
        end

        if (success) begin
            $display("Teste bem-sucedido");
        end else begin
            $display("Teste falhou");
        end
    
        $finish;
    end
endmodule