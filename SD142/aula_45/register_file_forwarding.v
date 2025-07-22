module register_file_forwarding (
    input wire clk,
    input wire rst,
    input wire we1,
    input wire [2:0] write_addr1,
    input wire [15:0] write_data1,
    input wire we2,
    input wire [2:0] write_addr2,
    input wire [15:0] write_data2,
    input wire [2:0] read_addr1,
    input wire [2:0] read_addr2,
    output reg [15:0] read_data1,
    output reg [15:0] read_data2
);

reg [15:0] regs [7:0];
integer i;
always @(posedge clk) begin
    if (rst) begin
        for (i = 0; i < 8; i = i + 1)
            regs[i] <= 16'd0;
    end else begin
        if (we1 && write_addr1 != 3'd0 && write_addr1 != write_addr2)
            regs[write_addr1] <= write_data1;
        if (we2 && write_addr2 != 3'd0)
            regs[write_addr2] <= write_data2;
    end
end

always @(posedge clk) begin
    if (we2 && (read_addr1 == write_addr2) && (read_addr1 != 3'd0))
        read_data1 <= write_data2;
    else if (we1 && (read_addr1 == write_addr1) && (read_addr1 != 3'd0) && (write_addr1 != write_addr2 || !we2))
        read_data1 <= write_data1;
    else
        read_data1 <= regs[read_addr1];

    if (we2 && (read_addr2 == write_addr2) && (read_addr2 != 3'd0))
        read_data2 <= write_data2;
    else if (we1 && (read_addr2 == write_addr1) && (read_addr2 != 3'd0) && (write_addr1 != write_addr2 || !we2))
        read_data2 <= write_data1;
    else
        read_data2 <= regs[read_addr2];
end
endmodule
