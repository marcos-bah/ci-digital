module q4_4_adder_subtractor_tb;

    reg  [7:0] a;
    reg  [7:0] b;
    reg        sel;
    wire [8:0] result;

    q4_4_adder_subtractor uut (
        .a(a),
        .b(b),
        .sel(sel),
        .result(result)
    );

    initial begin
        $display("\n TESTBENCH DO SOMADOR/SUBTRATOR DE Q4.4 BITS \n");
        $monitor("Tempo=%0t | a=%b | b=%b | sel=%b | result=%b", $time, a, b, sel, result);

        a = 8'b00110000; // 3,0
        b = 8'b00001100; // 0,75
        sel = 1'b0; // Adição
        #10;
        a = 8'b00111000; // 3,5
        b = 8'b00001100; // 0,75
        sel = 1'b0; // Adição
        #10;

        $stop;
    end

endmodule
