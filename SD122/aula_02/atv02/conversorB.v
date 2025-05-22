module conversorB (
    input H,G,F,E,
    output B
);
    assign B = (~H & ~G & E) | (~H & ~G & F) | (~H & G & ~F & ~E) | (H & ~G & ~F & E);
endmodule