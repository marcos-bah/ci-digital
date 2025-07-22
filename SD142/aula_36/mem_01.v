module mem_01 (
    input clk, cs, we_mem_in, we_resultado,
    input [8:0] endereco_saida, enderecoA, enderecoB,
    input [7:0] dado_in,
    input [2:0] opcode,
    output [7:0] sdadosA, sdadosB, s_ula, saida
);

wire [7:0] w_out_a, w_out_b, w_res;
wire w_ack;

dual_port_ram memoria_dupla (
    .clk(clk), 
    .cs(cs),
    .we_a(we_mem_in), 
    .data_in_a(dado_in), 
    .addr_a(enderecoA),
    .addr_b(enderecoB), 
    .data_out_a(w_out_a),
    .data_out_b(w_out_b)
);

sync_ram_single_port memoria_resultado (
    .clk(clk), 
    .cs(cs), 
    .we(we_resultado),
    .addr(endereco_saida), 
    .data_in(w_res),
    .data_out(saida)
);

ula unidade (
    .ena(1'b1), 
    .clk(clk),
    .op1(w_out_a), 
    .op2(w_out_b), 
    .op_sel(opcode),
    .res(w_res),
    .ula_ack(w_ack)
);

assign sdadosA = w_out_a;
assign sdadosB = w_out_b;
assign s_ula = w_res;
    
endmodule