module mux2x1 (
    input [1:0] in,
    input sel,
    output reg out
);
    always @(*) begin
        out = in[sel];
    end
endmodule