module mux(D, sel, y);
input [1:0] D; 
input sel;
output y;

assign y = (!sel & D[0]) | (sel & D[1]);

endmodule