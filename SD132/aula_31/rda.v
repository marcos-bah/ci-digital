module rda #(parameter N = 4) (
    input clk, rst, start,
    input [N-1:0] dividendo, divisor,
    output [N-1:0] regQ,
    output [N:0] regA,
    output [($clog2(N+1))-1:0] count
);

    wire load, shift, hab_A, set_Q0, op;

    datapath #(.N(N)) data (
        .load(load),
        .shift(shift),
        .hab_A(hab_A),
        .set_Q0(set_Q0),
        .dividendo(dividendo),
        .divisor(divisor),
        .regQ(regQ),
        .count(count),
        .op(op),
        .clk(clk),
        .rst(rst),
        .regA(regA)
    );

    control #(.N(N)) controller (
        .clk(clk),
        .rst(rst),
        .start(start),
        .A(regA),
        .count(count),
        .load(load),
        .shift(shift),
        .hab_A(hab_A),
        .set_Q0(set_Q0),
        .op(op)
    );
    
endmodule