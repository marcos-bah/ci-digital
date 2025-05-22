module conversorD (
    input H,G,F,E,
    output D
);
    assign D = H & G;
endmodule