module demux1xN #(parameter N = 8) (
    input in,
    input [$clog2(N)-1:0] sel,
    output reg [N-1:0] out
);

    always @(*) begin
        out = 0;
        out[sel] = in;
    end
endmodule