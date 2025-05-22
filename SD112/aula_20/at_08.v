module at_08(
    input A, B, C,
    output NS, S
);

assign NS = (A | B) & (A | ~C) & (B | C);
assign S = (C & A) | (~C & B);
    
endmodule