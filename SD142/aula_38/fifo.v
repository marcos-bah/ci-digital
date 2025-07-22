module fifo(rst, clk, data_in, wr, full, data_out, rd, empty);
    input rst, clk;
    input [7:0] data_in;
    input wr, rd;
    output full, empty;
    output [7:0] data_out;

    wire [2:0] w_addr, r_addr;

    mem_ram M1(clk, data_in, w_addr, wr, r_addr, rd, data_out);
    control_fifo C1(rst, clk, w_addr, wr, full, r_addr, rd, empty);
endmodule
