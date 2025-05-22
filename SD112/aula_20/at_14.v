module at_14(
    input A, B, C, D,
    output NS, S
);

assign NS = A & ~B & C | ~A & B & D;
assign S = A & ~B & C | ~A & B & D;
    
endmodule