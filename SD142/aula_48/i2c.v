module i2c (
    input wire clk,
    input wire reset,
    input wire master_start,
    input wire [6:0] slave_address,
    input wire master_rw,
    input wire [7:0] master_data_in,
    input wire [7:0] slave_data_in,
    input wire master_ack,
    output wire [7:0] master_data_out,
    output wire [7:0] slave_data_out,
    output wire master_done,
    output wire slave_data_ready,
    output wire slave_ack_error,
    output wire slave_start,

    inout wire scl,
    inout wire sda
);

    wire scl_wire, sda_wire;
    assign scl = scl_wire;
    assign sda = sda_wire;

    i2c_master MASTER (
        .clk(clk),
        .reset(reset),
        .start(master_start),
        .slave_addr(slave_address),
        .rw(master_rw),
        .data_in(master_data_in),
        .data_slave(master_data_out),
        .ack_master(master_ack),
        .scl(scl_wire),
        .sda(sda_wire),
        .done(master_done)
    );

    i2c_slave SLAVE (
        .clk(clk),
        .reset(reset),
        .scl(scl_wire),
        .sda(sda_wire),
        .data_out(slave_data_out),
        .data_in(slave_data_in),
        .data_ready(slave_data_ready),
        .ack_error(slave_ack_error),
        .start(slave_start)
    );

endmodule