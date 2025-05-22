module demux1x2 (
    input in,
    input sel,
    output reg [1:0] out
);

    always @(*) begin
        out = 2'b0;
        out[sel] = in;
    end
endmodule