module demux1x8 (
    input in,
    input [2:0] sel,
    output [7:0] out
);

    wire w_01, w_02;

    demux1x2 i2 (.in(in), .sel(sel[2]), .out({w_01, w_02}));

    demux1x4 i0 (.in(w_01), .sel(sel[1:0]), .out(out[7:4]));
    demux1x4 i1 (.in(w_02), .sel(sel[1:0]), .out(out[3:0]));
endmodule