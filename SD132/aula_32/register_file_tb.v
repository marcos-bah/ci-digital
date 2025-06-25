module register_file_tb;

    localparam DATA_WIDTH = 4;
    localparam ADDR_WIDTH = 2;
    localparam REG_COUNT  = 4;

    reg clk, wr_en;
    reg  [ADDR_WIDTH-1:0] wr_addr, rd_addr1, rd_addr2;
    reg  [DATA_WIDTH-1:0] wr_data;
    wire [DATA_WIDTH-1:0] rd_data1, rd_data2;
    wire wr_ack;

    register_file #(
        .DATA_WIDTH(DATA_WIDTH),
        .ADDR_WIDTH(ADDR_WIDTH),
        .REG_COUNT(REG_COUNT)
    ) uut (
        .clk(clk),
        .wr_en(wr_en),
        .wr_addr(wr_addr),
        .wr_data(wr_data),
        .rd_addr1(rd_addr1),
        .rd_addr2(rd_addr2),
        .rd_data1(rd_data1),
        .rd_data2(rd_data2),
        .wr_ack(wr_ack)
    );

    initial begin
    	clk = 0;
    	forever #5 clk = ~clk;
	end

    initial begin
        $display("\nTestbench do banco de registradores");

        wr_en = 0;
        wr_addr = 0;
        wr_data = 0;
        rd_addr1 = 0;
        rd_addr2 = 1;

        #10;

        wr_en = 1;
        wr_addr = 2;
        wr_data = 4'b1010;

        #10;

        wr_addr = 3;
        wr_data = 4'b0101;

        #10;

        wr_en = 0;

        rd_addr1 = 2;
        rd_addr2 = 3;

        #10;

        $display("rd_data1 = %b (esperado: 1010)", rd_data1);
        $display("rd_data2 = %b (esperado: 0101)", rd_data2);

        wr_addr = 0;
        wr_data = 0;
        rd_addr1 = 0;
        rd_addr2 = 1;

        #10;

        $finish;
    end

endmodule
