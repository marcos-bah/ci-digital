module mux2(D, sel, y);
input [1:0] D; 
input sel;
output y;

// assign saida = condicao ? if_true : if_false

assign y = sel ? D[0] : D[1];

endmodule