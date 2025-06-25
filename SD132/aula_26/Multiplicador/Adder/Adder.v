module Adder #(parameter DATA_LENGTH = 4) (
    input  [DATA_LENGTH-1:0] OperandoA, OperandoB,
    output [DATA_LENGTH:0]   Soma
);

assign Soma = OperandoA + OperandoB;

endmodule
