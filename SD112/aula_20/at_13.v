module at_13(
    input A, B, C, D,
    output NS, S
);

assign NS = (A | B) & (~A | C) & (B | ~D);
assign S = (C & B) | (B & ~A) | (A & C & ~D);
    
endmodule