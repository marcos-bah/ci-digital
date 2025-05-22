module conversorC (
    input H,G,F,E,
    output C
);
    assign C = (!H & F & E) | (~H & ~F & ~E) | (~G & ~F & ~E);
endmodule