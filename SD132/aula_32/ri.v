module ri (
    input wire [7:0] data_in,
    input wire clk, ena,
    output reg [1:0] mmm, wr_addr_mnm,
    output reg [3:0] rd_addr_wr_data
);

    always @(posedge clk) begin
        if (ena) begin
            mmm <= data_in[7:6];
            wr_addr_mnm <= data_in[5:4];
            rd_addr_wr_data <= data_in[3:0];
        end
    end

endmodule
