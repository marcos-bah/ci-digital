module at_05(
    input A, B,
    output NS, S
);

assign NS = (A | B) & (~A | B); 
assign S = B;
    
endmodule