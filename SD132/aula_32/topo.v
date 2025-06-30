module topo (
    input clk, rst
);
    wire [7:0] addr_bus, data_bus;
    wire [3:0] data_in, data_out, operand_A, operand_B, res;
    wire [2:0] rd_addr, wr_addr;
    wire [1:0] sel_addr, sel_mux1;
    wire ena_pc, ena_mem, ena_ri, ena_rf, ena_ula;
    wire pc_ack, ri_ack, rf_ack, ula_ack;

    wire [3:0] ep1, ep2, ep_sel;
    wire [3:0] wr_data;
    wire wr_data_ula, wr_data_ldr;
    wire sel_wr_ula;
    wire sel_rd;
    wire [2:0] rd_addr_ri, wr_addr_rf;

    counter pc_counter (
        .clk(clk), .ena(ena_pc), .rst(rst),
        .addr_bus(addr_bus), .ack(pc_ack)
    );

    rom_8x256 mem_inst (
        .clk(clk), .ena(ena_mem), .addr_bus(addr_bus),
        .data_bus(data_bus), .ack()
    );

    ri ri_inst (
        .clk(clk), .ena(ena_ri), .rst(rst),
        .data_in(data_bus[7:4]),
        .ena_out(data_bus[3:0]),
        .ep1(ep1), .ep2(ep2), .ep_sel(ep_sel),
        .rd_addr(rd_addr_ri), .wr_addr(wr_addr_rf),
        .ack(ri_ack)
    );

    register_file regfile_inst (
        .clk(clk), .ena(ena_rf), .rst(rst),
        .rd_addr1(rd_addr), .rd_addr2(rd_addr_ri),
        .wr_addr(wr_addr),
        .wr_data(wr_data),
        .operand_A(operand_A), .operand_B(operand_B),
        .ack(rf_ack)
    );

    ula ula_inst (
        .clk(clk), .ena(ena_ula), .rst(rst),
        .op1(operand_A), .op2(operand_B), .op_sel(ep_sel),
        .res(res), .ula_ack(ula_ack)
    );

    mux_2x1 mux_sel_wr (
        .in0(rd_addr_ri), .in1(data_bus[2:0]),
        .sel(sel_rd), .out(rd_addr)
    );

    mux_2x1 mux_data_wr (
        .in0(res), .in1(data_bus[3:0]),
        .sel(sel_wr_ula), .out(wr_data)
    );

    demux_1x2_4 demux_wr_data (
        .in(wr_data), .sel(sel_wr_ula),
        .out0(wr_data_ldr), .out1(wr_data_ula)
    );

    fsm fsm_inst (
        .clk(clk), .rst(rst),
        .pc_ack(pc_ack), .ri_ack(ri_ack),
        .rf_ack(rf_ack), .ula_ack(ula_ack),
        .ena_pc(ena_pc), .ena_mem(ena_mem),
        .ena_ri(ena_ri), .ena_rf(ena_rf),
        .ena_ula(ena_ula),
        .sel_addr(sel_addr), .sel_wr_ula(sel_wr_ula),
        .sel_rd(sel_rd)
    );

endmodule
