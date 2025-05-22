module at_10(
    input A, B, C,
    output NS, S
);

assign NS = A & B & ~C | ~A & B & C;
assign S = B & (A | C) & (~A | ~C);
    
endmodule