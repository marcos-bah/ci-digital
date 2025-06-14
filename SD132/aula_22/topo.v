module topo (
    input clk,
    input rst,
    input [2:0] entrada,
    input HabA,
    input HabB,
    input HabC,
    output [2:0] saida
);
    wire [2:0] SregA, SregB, SregC, SregAB, SregS;
    wire [2:0] Wsaida;
    wire HabRegAB, HabRegS, LoadDesloca, Desloca, HabRegFim;

    regi rega (.clk(clk), .rst(rst), .enable(HabA), .d(entrada), .q(SregA));
    regi regb (.clk(clk), .rst(rst), .enable(HabB), .d(entrada), .q(SregB));
    regi regc (.clk(clk), .rst(rst), .enable(HabC), .d(entrada), .q(SregC));

    wire [2:0] soma1 = SregA + SregB;
    regi regab (.clk(clk), .rst(rst), .enable(HabRegAB), .d(soma1), .q(SregAB));

    wire [2:0] soma2 = SregAB + SregC;
    regi regs (.clk(clk), .rst(rst), .enable(HabRegS), .d(soma2), .q(SregS));

    deslocamento deslocador (.clk(clk), .rst(rst), .load(LoadDesloca), .enable(Desloca), .d(SregS), .q(Wsaida));
    regi regfim (.clk(clk), .rst(rst), .enable(HabRegFim), .d(Wsaida), .q(saida));

    controle UCONTROLE (
        .clk(clk), .rst(rst),
        .HabA(HabA), .HabB(HabB), .HabC(HabC),
        .HabRegAB(HabRegAB), .HabRegS(HabRegS),
        .LoadDesloca(LoadDesloca), .Desloca(Desloca),
        .HabRegFim(HabRegFim)
    );
endmodule
