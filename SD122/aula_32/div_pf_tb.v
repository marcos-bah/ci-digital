module div_pf_tb;
    reg [7:0] numerator;
    reg [7:0] denominator;
    wire [7:0] result;
    wire divide_by_zero;

    div_pf uut (
        .numerator(numerator),
        .denominator(denominator),
        .result(result),
        .divide_by_zero(divide_by_zero)
    );

    function q4_4_to_real;
        input [7:0] val;
        begin
            q4_4_to_real = $itor(val) / 16.0;
        end
    endfunction

    initial begin
        $display("\n");

        // Test 1: 4.0 / 2.0 = 2.0
        numerator = 8'sd64;      // 4.0
        denominator = 8'sd32;    // 2.0
        #10;
        $display("1_ %f / %f = %f Div0: %b", q4_4_to_real(numerator), q4_4_to_real(denominator), q4_4_to_real(result), divide_by_zero);

        // Test 2: 4.0 / 0.0 = div0
        numerator = 8'sd64;
        denominator = 8'sd0;
        #10;
        $display("2_ %f / %f = %f Div0: %b", q4_4_to_real(numerator), q4_4_to_real(denominator), q4_4_to_real(result), divide_by_zero);

        $finish;
    end
endmodule
