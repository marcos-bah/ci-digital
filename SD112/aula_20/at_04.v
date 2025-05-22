module at_04(
    input A, B,
    output NS, S
);

assign NS = ~(A & ~B) | (A & B); //~A & B
assign S = B;
    
endmodule