module div_pf(
    input signed [7:0] numerator,
    input signed [7:0] denominator,
    output reg [7:0] result,
    output reg divide_by_zero
);
    reg signed [15:0] numerator_ext;
    reg signed [15:0] raw_result;

    always @(*) begin
        divide_by_zero = (denominator == 0);
        numerator_ext = numerator <<< 4;
        
        raw_result = divide_by_zero ? 0 : numerator_ext / denominator;
        result = raw_result[7:0];
    end
endmodule
