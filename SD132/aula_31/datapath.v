module datapath #(parameter N = 4) (
    input load, shift, hab_A, set_Q0, op, clk, rst,
    input [N-1:0] dividendo, divisor,
    output [N-1:0] regQ,
    output [N:0] regA,
    output [($clog2(N+1))-1:0] count 
);

    wire [N:0] operando;
    wire [N-1:0] saidaRegM;
    
    regAQ aq (.dividendo(dividendo), .load(load), .clk(clk), .rst(rst), .shift(shift), .hab_A(hab_A), .set_Q0(set_Q0), .operando(operando), .regA(regA), .regQ(regQ));
    regM m (.divisor(divisor), .load(load), .clk(clk), .rst(rst), .saida(saidaRegM));

    ula operacao (.op(op), .a(regA), .b(saidaRegM), .y(operando));

    counter c (.clk(shift), .rst(rst), .count(count));
endmodule