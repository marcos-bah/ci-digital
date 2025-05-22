module mux16x1 (
    input [15:0] in,
    input [3:0] sel,
    output reg out
);
    always @(*) begin
        out = in[sel];
    end
endmodule