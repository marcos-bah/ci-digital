module at_16(
    input A, B, C, D,
    output NS, S
);

assign NS = (A | ~B) & (C | D) & (~A | B);
assign S = (A | ~B) & (C | D) & (~A | B);
    
endmodule