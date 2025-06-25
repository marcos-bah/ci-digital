module rda (
    input clk, rst, start,
    input [3:0] dividendo, divisor,
    output [3:0] regQ,
    output [4:0] regA,
    output [2:0] count
);

    wire load, shift, hab_A, set_Q0, op;

    datapath data (
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

    control controller (
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