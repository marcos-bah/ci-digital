module Multiplicador #(parameter DATA_LENGTH = 4) (
    input  [DATA_LENGTH-1:0] Multiplicando, Multiplicador,
    input  St, Clk, rst,
    output [(DATA_LENGTH*2)-1:0] Produto,
    output Idle, Done
);

wire Load, Sh, Ad, K, M;
wire [DATA_LENGTH:0] soma;
wire [DATA_LENGTH-1:0] operandoB;
wire [(DATA_LENGTH*2):0] resultado;

assign M = resultado[0];
assign operandoB = resultado[(DATA_LENGTH*2)-1 : DATA_LENGTH];

CONTROL control (
    .Idle(Idle),
    .Done(Done),
    .St(St),
    .Load(Load),
    .Sh(Sh),
    .Ad(Ad),
    .Clk(Clk),
    .k(K),
    .M(M),
    .rst(rst)
);

ACC #(DATA_LENGTH) acc (
    .Saidas(resultado),
    .Entradas({soma, Multiplicador}),
    .Load(Load),
    .Sh(Sh),
    .Ad(Ad),
    .Clk(Clk),
    .rst(rst)
);

Adder #(DATA_LENGTH) adder (
    .OperandoA(Multiplicando),
    .OperandoB(operandoB),
    .Soma(soma)
);

Counter #(DATA_LENGTH) counter (
    .Load(Load),
    .rst(rst),
    .Clk(Clk),
    .K(K)
);

assign Produto = resultado[(DATA_LENGTH*2)-1 : 0];

endmodule
