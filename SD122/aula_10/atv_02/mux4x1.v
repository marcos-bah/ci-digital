module mux4x1 (
    input [3:0] in,
    input [1:0] sel,
    output reg out
);
    always @(*) begin
        out = in[sel];
    end
endmodule