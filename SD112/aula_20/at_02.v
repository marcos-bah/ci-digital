module at_02(
    input A, B,
    output NS, S
);

assign NS = ~(A | B) | (A & B);
assign S = (~A & ~B) | (A & B);
    
endmodule