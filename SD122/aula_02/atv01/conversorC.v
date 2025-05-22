module conversorC (
    input H,G,F,E,
    output C
);
    assign C = (!H & G & E) | (H & !G);
endmodule