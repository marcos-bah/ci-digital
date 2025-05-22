module q5_3_multiplier (
    input  wire [7:0] a,
    input  wire [7:0] b,
    output reg  [15:0] result
);

    always @(*) begin
        result = (a * b) >>> 3;
    end

endmodule