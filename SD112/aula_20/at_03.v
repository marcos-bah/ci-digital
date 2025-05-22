module at_03(
    input A, B,
    output NS, S
);

assign NS = (A & B) | (A & ~B);
assign S = A;
    
endmodule