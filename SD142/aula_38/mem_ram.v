module mem_ram(clk, data_in, w_addr, we, r_addr, re, data_out);
    input clk;
    input [7:0] data_in;
    input [2:0] w_addr, r_addr;
    input we, re;
    output reg [7:0] data_out;

    reg [7:0] ram[0:7];

    always @(posedge clk) begin
        if (we)
            ram[w_addr] <= data_in;
        if (re)
            data_out <= ram[r_addr];
    end
endmodule
