module q5_3_multiplier_tb;

    reg  [7:0] a;
    reg  [7:0] b;
    wire [15:0] result;

    q5_3_multiplier uut (
        .a(a),
        .b(b),
        .result(result)
    );

    initial begin
        $display("\n TESTBENCH DO MULTIPLICADOR DE Q5.3 BITS \n");
        $monitor("Tempo=%0t | a=%b | b=%b | result=%b", $time, a, b, result);

        a = 8'b00110000; // 6,0
        b = 8'b00001100; // 1,5
        #10;
        a = 8'b01011000; // 11
        b = 8'b00001100; // 1,5
        #10;

        $stop;
    end

endmodule
