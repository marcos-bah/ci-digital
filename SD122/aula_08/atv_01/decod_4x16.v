module decod_4x16 (
    input [3:0] in,
    output reg [15:0] out
);

    always @(*) begin
        out = 16'b0000_0000_0000_0000;
        if (in > 0 & in < 16) begin
            out[in-1] = 1;
        end
    end

endmodule