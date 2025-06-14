module topo_tb;

reg clk, rst;
reg [2:0] entrada;
reg HabA, HabB, HabC;

wire [2:0] saida;

topo DUT (
    .clk(clk),
    .rst(rst),
    .entrada(entrada),
    .HabA(HabA),
    .HabB(HabB),
    .HabC(HabC),
    .saida(saida)
);

initial begin
    $display("\nTestbench: Maquina de Estado com Controle de Registradores");

    clk = 0;
    forever #10 clk = ~clk;
end

initial begin
    rst = 1;
    entrada = 3'b000;
    HabA = 0;
    HabB = 0;
    HabC = 0;

    #25 rst = 0;

    // Entrada A = 3'b001
    #10 entrada = 3'b001; HabA = 1;
    #30 HabA = 0;

    // Entrada B = 3'b010
    #20 HabB = 1;
    #30 entrada = 3'b010; HabB = 0;

    // Entrada C = 3'b011
    #20 entrada = 3'b011; HabC = 1;
    #20 HabC = 0;

    // Aguarda processamento da FSM
    #200;

    $finish;
end

endmodule
