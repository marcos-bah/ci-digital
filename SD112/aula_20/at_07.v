module at_07(
    input A, B, C,
    output NS, S
);

assign NS = (A & B) | (A & ~B & C);
assign S = A & (B | C);
    
endmodule