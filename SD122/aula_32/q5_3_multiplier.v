module q5_3_multiplier (
    input wire signed [7:0] a,
    input wire signed [7:0] b,
    output reg signed [7:0] result,
    output reg cout
);

    reg signed [15:0] temp_result;

    always @(*) begin
        temp_result = a * b;

        if (temp_result > 16'sd127) begin
            result = 8'sd127;
            cout = 1'b1;
        end else if (temp_result < -16'sd128) begin
            result = -8'sd128;
            cout = 1'b1;
        end else begin
            result = temp_result >>> 3;
            cout = 1'b0;
        end
    end

endmodule
