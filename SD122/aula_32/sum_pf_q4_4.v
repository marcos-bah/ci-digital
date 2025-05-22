module sum_pf_q4_4(
    input signed [7:0] A,
    input signed [7:0] B,
    input op,
    output reg signed [7:0] result,
    output reg Cout
);
    reg signed [15:0] raw_result;
    reg overflow;

    always @(*) begin
        {overflow, raw_result[3:0]} = A[3:0] + B[3:0];
    end
endmodule
