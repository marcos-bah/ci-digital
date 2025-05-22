module q5_3_multiplier_tb();

    reg signed [7:0] a, b;
    wire signed [7:0] result;
    wire cout;

    q5_3_multiplier uut (
        .a(a),
        .b(b),
        .result(result),
        .cout(cout)
    );

    task display_result;
        input signed [7:0] a_in, b_in, result_out;
        input cout_out;
        begin
            $display("A = %d (%.3f), B = %d (%.3f), Result = %d (%.3f), Cout = %b",
                     a_in, a_in / 8.0, b_in, b_in / 8.0,
                     result_out, result_out / 8.0, cout_out);
        end
    endtask

    initial begin
        $display("\n=== Testbench Q5.3 Multiplier ===");

        // Teste 1: 3.5 * 2.0 (Resultado = 7.0)
        a = 8'b0001_1100; // 3.5
        b = 8'b0010_0000; // 2.0
        #10 display_result(a, b, result, cout);

        // Teste 2: -2.25 * 4.0 (Resultado = -9.0)
        a = 8'b1111_1010; // -2.25
        b = 8'b0100_0000; // 4.0
        #10 display_result(a, b, result, cout);

        // Teste 3: 5.5 * -1.0 (Resultado = -5.5)
        a = 8'b0010_1100; // 5.5
        b = 8'b1111_1000; // -1.0
        #10 display_result(a, b, result, cout);

        // Teste 4: Saturação positiva (7.5 * 2.5) - Esperado: saturação
        a = 8'b0111_1100; // 7.5
        b = 8'b0010_0000; // 2.5
        #10 display_result(a, b, result, cout);

        // Teste 5: Saturação negativa (-8.0 * -2.0) - Esperado: saturação
        a = 8'b1000_0000; // -8.0
        b = 8'b1110_0000; // -2.0
        #10 display_result(a, b, result, cout);

        // Teste 6: Caso sem overflow (-3.0 * 2.5)
        a = 8'b1110_1000; // -3.0
        b = 8'b0010_0000; // 2.5
        #10 display_result(a, b, result, cout);

        $finish;
    end

endmodule
