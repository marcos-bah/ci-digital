module register_file #(
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 5,
    parameter REG_COUNT = 32
)(
    input wire clk, wr_en,
    input wire [ADDR_WIDTH-1:0] wr_addr, rd_addr1, rd_addr2,
    input wire [DATA_WIDTH-1:0] wr_data,
    output reg [DATA_WIDTH-1:0] rd_data1, rd_data2,
    output reg wr_ack
);

reg [DATA_WIDTH-1:0] registers [0:REG_COUNT-1];

always @(posedge clk) begin
    if (wr_en) begin
        #1 registers[wr_addr] <= wr_data;
        wr_ack <= 1;
    end else begin
        wr_ack <= 0;
    end

    #2 rd_data1 <= registers[rd_addr1];
    #2 rd_data2 <= registers[rd_addr2];
end


endmodule
