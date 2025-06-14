module Multiplicador(
	input [3:0] Multiplicando, 
	input [3:0] Multiplicador,
	input St, Clk, rst,
	output [7:0] Produto,
	output Idle, Done
);

wire Load, Sh, Ad, K, M;

Adder adder (
	.OperandoA(), 
	.OperandoB(),
	.Soma()
);

ACC acc(
	.Load(), 
    .rst(rst),
	.Sh(), 
	.Ad(), 
	.Clk(), 
	.Entradas(),
	.Saidas()
);

CONTROL control(
	.Clk(), 
    .rst(rst),
	.K(), 
	.St(), 
	.M(),
	.Idle(), 
	.Done(), 
	.Load(), 
	.Sh(),
	.Ad()
);

Counter counter(
	.Load(),
    .rst(rst),
	.Clk(),
	.K()
);

endmodule
