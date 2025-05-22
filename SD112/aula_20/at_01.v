module at_01(
    input A, B,
    output NS, S
);

assign NS = A & (B | ~B);
assign S = A;
    
endmodule