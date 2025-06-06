module comparador_4b (
    input [3:0] a, b,
    output out
);
    assign out = (a < b) ? 1'b1 : 1'b0;
endmodule
