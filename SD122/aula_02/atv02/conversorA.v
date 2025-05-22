module conversorA (
    input H,G,F,E,
    output A
);
    assign A = (H & ~G & ~F) | (~H & G & E) | (~H & G & E);
endmodule