module q4_4_adder_subtractor_tb();

    reg  [7:0] a;
    reg  [7:0] b;
    reg        op;
    reg        cin;
    wire [7:0] result;
    wire       cout;

    q4_4_adder_subtractor uut (
        .a(a),
        .b(b),
        .op(op),
        .cin(cin),
        .result(result),
        .cout(cout)
    );

    task display_result;
        input signed [7:0] a_in, b_in, res_out;
        input op_in, cin_in, cout_out;
        begin
            $display("A = %0d (%.4f), B = %0d (%.4f), op = %b, cin = %b => Result = %0d (%.4f), cout = %b",
                $signed(a_in), $signed(a_in) / 16.0,
                $signed(b_in), $signed(b_in) / 16.0,
                op_in, cin_in,
                $signed(res_out), $signed(res_out) / 16.0,
                cout_out);
        end
    endtask

    initial begin
        $display("\n=== Testbench Q4.4 Adder/Subtractor ===");

        // Exemplo: 7.5 + 2.25 em Q4.4 (Overflow)
        a = 8'b0111_1000; // 7.5
        b = 8'b0010_0100; // 2.25
        op = 0; // soma
        cin = 0;
        #10 display_result(a, b, result, op, cin, cout);

        // Exemplo: 7.5 - 2.25 em Q4.4
        a = 8'b0111_1000; // 7.5
        b = 8'b0010_0100; // 2.25
        op = 1; // subtração
        cin = 0;
        #10 display_result(a, b, result, op, cin, cout);

        // Exemplo: -7.5 + 2.25 em Q4.4
        a = 8'b1000_1000; // -7.5
        b = 8'b0010_0100; // 2.25
        op = 0; // soma
        cin = 0;
        #10 display_result(a, b, result, op, cin, cout);

        // Exemplo: -7.5 - 2.25 em Q4.4 (Overflow)
        a = 8'b1000_1000; // -7.5
        b = 8'b0010_0100; // 2.25
        op = 1; // subtração
        cin = 0;
        #10 display_result(a, b, result, op, cin, cout);

        $finish;
    end

endmodule
