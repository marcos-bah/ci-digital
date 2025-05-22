module decod_4x16 (
    input [3:0] in,
    output reg [15:0] out
);
    wire [7:0] out1, out2;

    decod_3x8 i0 (.in(in[2:0]), .out(out1));
    decod_3x8 i1 (.in(in[2:0]), .out(out2));

    always @(*) begin
        out = in[3] ? {out1, 8'b0000_0000} : {8'b0000_0000, out2};
    end

endmodule