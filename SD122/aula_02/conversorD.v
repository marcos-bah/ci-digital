module conversorD (
    input H,G,F,E,
    output D
);
    assign D = (~F & E) | (F & ~E);
endmodule