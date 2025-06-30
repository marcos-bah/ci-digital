module register_file #(
    parameter DATA_WIDTH = 4,
    parameter ADDR_WIDTH = 2,
    parameter REG_COUNT  = 4
)(
    input  clk,
    input  wr_en,
    input  [ADDR_WIDTH-1:0]  wr_addr,
    input  [DATA_WIDTH-1:0]  wr_data,
    input  [ADDR_WIDTH-1:0]  rd_addr1,
    input  [ADDR_WIDTH-1:0]  rd_addr2,
    output [DATA_WIDTH-1:0]  rd_data1,
    output [DATA_WIDTH-1:0]  rd_data2,
    output reg                    wr_ack
);

    reg [DATA_WIDTH-1:0] registers [0:REG_COUNT-1];

    always @(posedge clk) begin
        if (wr_en) begin
            registers[wr_addr] <= wr_data;
        end

        if (registers[wr_addr] == wr_data)
            wr_ack <= 1'b1;
        else
            wr_ack <= 1'b0;
    end

    assign rd_data1 = registers[rd_addr1];
    assign rd_data2 = registers[rd_addr2];

endmodule
