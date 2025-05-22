module datapath (
    input [3:0] dados,
    input sel21, sel12, clk,
    input [2:0] operacao,
    output [3:0] resultado,
    output carry_out
);
    wire wA, wB;
    wire [3:0] A, B, regA, regB;
    wire [3:0] data_in, data_out;

    mux2x1_4bits mux (.in0(dados), .in1(resultado), .sel(sel21), .out(data_in));

    register_file register_file (.clk(clk), .we(1'b1), .addr(2'b00), .data_in(data_in), .data_out(data_out)); //escrita

    demux1x2_4bits demux (.in(data_out), .sel(sel12), .out0(regA), .out1(regB));

    register_4bits register_a (.clk(clk), .reset(1'b0), .enable(~sel12), .d(regA), .q(A));
    register_4bits register_b (.clk(clk), .reset(1'b0), .enable(sel12), .d(regB), .q(B));

    ula ula (.A(A), .B(B), .seletor(operacao), .resultado(resultado), .carry_out(carry_out));
endmodule