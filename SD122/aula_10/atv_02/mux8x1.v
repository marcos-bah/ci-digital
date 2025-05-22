module mux8x1 (
    input [7:0] in,
    input [2:0] sel,
    output out
);
    wire [1:0] aux;

    mux4x1 i0 (.in(in[7:4]), .sel(sel[1:0]), .out(aux[1]));
    mux4x1 i1 (.in(in[3:0]), .sel(sel[1:0]), .out(aux[0]));

    mux2x1 i2 (.in(aux), .sel(sel[2]), .out(out));
endmodule