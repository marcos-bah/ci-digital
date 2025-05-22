module conversorC (
    input H,G,F,E,
    output C
);
    assign C = (G & ~F) | (~G & F);
endmodule