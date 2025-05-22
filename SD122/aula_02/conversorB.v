module conversorB (
    input H,G,F,E,
    output B
);
    assign B = (~H & G) | (H & ~G);
endmodule