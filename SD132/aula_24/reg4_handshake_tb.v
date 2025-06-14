module reg4_handshake_tb;
    reg clk;
    reg rst;
    reg en;
    reg [3:0] data_in;
    wire [3:0] data_out;
    wire fim;

    reg4_handshake uut (
        .clk(clk),
        .rst(rst),
        .en(en),
        .data_in(data_in),
        .data_out(data_out),
        .fim(fim)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        en = 0;
        data_in = 4'b0000;

        #10;
        rst = 0;

        #10;
        data_in = 4'b1010;
        en = 1;

        #10;

        data_in = 4'b1010;
        #10;

        data_in = 4'b1100;
        #10;

        en = 0;
        #10;

        rst = 1;
        #10;
        rst = 0;
        #20;
        $finish;
    end

endmodule
