module somador (soma, cout, A, B, cin);
	input cin;
	input [2:0] A, B;
	output cout;
	output [2:0] soma;
	
	assign {cout, soma} = A + B;

endmodule
