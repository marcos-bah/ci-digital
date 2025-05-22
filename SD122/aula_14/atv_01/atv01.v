module atv01 (
    input A, B,
    output Y
);
    wire y0, y1, y2, y3;
    decodificador_2x4 i0 (A, B, y0, y1, y2, y3);
    assign Y = y0 | y2;
endmodule