module mux3(D, sel, y);
input [1:0] D; 
input sel;
output y;

wire w1, w2;

or  I1(y,w1,w2);
and I2(w1,!sel,D[0]);
and I3(w2, sel,D[1]);

endmodule