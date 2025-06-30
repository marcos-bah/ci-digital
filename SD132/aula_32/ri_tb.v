module ri_tb;

    reg [7:0] data_in;
    reg clk, ena;
    wire [1:0] mmm, wr_addr_mnm;
    wire [3:0] rd_addr_wr_data;

    ri uut (
        .data_in(data_in),
        .clk(clk), .ena(ena),
        .mmm(mmm), .wr_addr_mnm(wr_addr_mnm),
        .rd_addr_wr_data(rd_addr_wr_data)
    );

    initial begin
        $display("\nTESTBENCH RI");

        clk = 0;
        ena = 0;
        data_in = 8'b00000000;

        #5 ena = 1;

        data_in = 8'b01011011; #10; // mmm=01, wr_addr_mnm=01, rd_addr_wr_data=1011
        data_in = 8'b11100100; #10; // mmm=11, wr_addr_mnm=10, rd_addr_wr_data=0100
        data_in = 8'b00011110; #10; // mmm=00, wr_addr_mnm=01, rd_addr_wr_data=1110

        ena = 0;

        #10 $finish;
    end

    always #5 clk = ~clk;

endmodule
