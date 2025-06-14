module topo (
    input [3:0] inA, inB,
    input clk, rst, operacao, 
    output [5:0] resultado
);

    wire hab_a, hab_b, hab_op, fim_a, fim_b, fim_op;
    wire [3:0] op_a, op_b;
    wire [5:0] res;
    
    reg4_handshake rega (.rst(rst), .clk(clk), .en(hab_a), .data_in(inA), .data_out(op_a), .fim(fim_a));
    reg4_handshake regb (.rst(rst), .clk(clk), .en(hab_b), .data_in(inB), .data_out(op_b), .fim(fim_b));

    soma_subtrator soma_subtrator (.op(operacao), .a(op_a), .b(op_b), .resultado(res[3:0]), .carryout(res[4]), .overflow(res[5]));

    reg6_handshake regc (.rst(rst), .clk(clk), .en(hab_op), .data_in(res), .data_out(resultado), .fim(fim_op));

    fsm fsm (.rst(rst), .clk(clk), .fimA(fim_a), .fimB(fim_b), .fimOp(fim_op), .habA(hab_a), .habB(hab_b), .habOp(hab_op));
endmodule