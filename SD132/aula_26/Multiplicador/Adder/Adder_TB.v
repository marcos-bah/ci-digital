module Adder_TB();

parameter DATA_LENGTH = 4;

reg  [DATA_LENGTH-1:0] OperandoA;
reg  [DATA_LENGTH-1:0] OperandoB;
wire [DATA_LENGTH:0]   Soma;

Adder #(DATA_LENGTH) dut (
    .OperandoA(OperandoA),
    .OperandoB(OperandoB),
    .Soma(Soma)
);

initial begin
    OperandoA = 2;
    OperandoB = 6;
    #10;
    $display("%d somado com %d resulta em %d", OperandoA, OperandoB, Soma);

    OperandoA = 4;
    OperandoB = 10;
    #10;
    $display("%d somado com %d resulta em %d", OperandoA, OperandoB, Soma);

    OperandoA = 8;
    OperandoB = 7;
    #10;
    $display("%d somado com %d resulta em %d", OperandoA, OperandoB, Soma);

    OperandoA = 1;
    OperandoB = 0;
    #10;
    $display("%d somado com %d resulta em %d", OperandoA, OperandoB, Soma);

    $stop;
end

endmodule
