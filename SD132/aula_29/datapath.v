module datapath (
    input load, shift, hab_A, set_Q0, op, clk, rst,
    input [3:0] dividendo, divisor,
    output [3:0] regQ,
    output [4:0] regA,
    output [2:0] count 
);

    wire [4:0] operando;
    wire [3:0] saidaRegM;
    
    regAQ aq (.dividendo(dividendo), .load(load), .clk(clk), .rst(rst), .shift(shift), .hab_A(hab_A), .set_Q0(set_Q0), .operando(operando), .regA(regA), .regQ(regQ));
    regM m (.divisor(divisor), .load(load), .clk(clk), .rst(rst), .saida(saidaRegM));

    ula operacao (.op(op), .a(regA), .b(saidaRegM), .y(operando));

    counter c (.clk(shift), .rst(rst), .count(count));
endmodule