module muxNx1 #(parameter N = 4)(
    input [N-1:0] in,
    input [$clog2(N)-1:0] sel,
    output reg out
);
    always @(*) begin
        out = in[sel];
    end
endmodule