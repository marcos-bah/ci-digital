module BrentKungAdder8_tb;
    reg [7:0] A, B;
    reg Cin;
    wire [7:0] Sum;
    wire Cout;

    // Instancia o módulo do somador
    BrentKungAdder8 uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    // Tarefas para teste
    task test_case;
        input [7:0] a, b;
        input cin;

        input [8:0] expected; // soma de 9 bits (Sum + Cout)
        begin
            A = a;
            B = b;
            Cin = cin;
            #10; // Aguarda a propagação dos sinais
            if ({Cout, Sum} !== expected) begin
                $display("ERRO: A=%d B=%d Cin=%b => Resultado=%b_%b, Esperado=%b", A, B, Cin, Cout, Sum, expected);
            end else begin
                $display("OK: A=%d B=%d Cin=%b => Resultado=%b_%b",A, B, Cin, Cout, Sum);
            end
        end
    endtask
    initial begin
        $display("Iniciando Testbench BrentKungAdder8");
        // Testes
        test_case(8'd15, 8'd27, 1'b0, 9'd42); // 15 + 27 = 42
        test_case(8'd100, 8'd155, 1'b0, 9'd255); // 100 + 155 = 255
        test_case(8'd200, 8'd100, 1'b0, 9'd300); // 200 + 100 = 300 (overflow)
        test_case(8'd255, 8'd1, 1'b1, 9'd257); // 255 + 1 + 1 = 257

        $display("Testbench finalizado.");

        $finish;
    end
endmodule