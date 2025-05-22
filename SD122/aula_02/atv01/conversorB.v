module conversorB (
    input H,G,F,E,
    output B
);
    assign B = (!H & G & !E) | (!G & F) | (H & !G);
endmodule