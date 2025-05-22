module at_12(
    input A, B, C, D,
    output NS, S
);

assign NS = A & B | ~A & C | B & D;
assign S = (A&B)|(~A&C)|(B&D);
    
endmodule