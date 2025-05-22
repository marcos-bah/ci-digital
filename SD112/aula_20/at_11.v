module at_11(
    input A, B, C,
    output NS, S
);

assign NS = (A | ~B) & (B | C) & (~A | C);
assign S = C & (A | ~B);
    
endmodule