module at_15(
    input A, B, C, D,
    output NS, S
);

assign NS = ~(A & B) | C & D;
assign S = ~A | ~B | (C & D);
    
endmodule