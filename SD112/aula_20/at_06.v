module at_06(
    input A, B,
    output NS, S
);

assign NS = A & (A | B) | ~A & (A | ~B); 
assign S = A | ~B;
    
endmodule