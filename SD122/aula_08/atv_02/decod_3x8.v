module decod_3x8 (
    input [3:0] in,
    output reg [7:0] out
);

    always @(*) begin
        out = 8'b0000_0000;
        if (in > 0 & in < 8) begin
            out[in-1] = 1;
        end
    end

endmodule