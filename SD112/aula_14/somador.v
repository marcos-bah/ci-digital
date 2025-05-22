module somador (soma, cout, A, B, cin);
	input cin;
	input [3:0] A, B;
	output cout;
	output [3:0] soma;
	
	wire [4:0] soma_aux;
	
	assign soma_aux = {1'b0,A} + {1'b0,B} + {4'b0000,cin};

	assign soma = soma_aux[3:0];
	assign cout = soma_aux[4];

endmodule
