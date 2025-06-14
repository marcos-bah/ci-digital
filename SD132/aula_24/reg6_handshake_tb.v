module reg6_handshake_tb;
    reg clk;
    reg rst;
    reg en;
    reg [5:0] data_in;
    wire [5:0] data_out;
    wire fim;

    reg6_handshake uut (
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
        data_in = 6'b000000;

        #10;
        rst = 0;

        #10;
        data_in = 6'b101010;
        en = 1;

        #10;

        data_in = 6'b101010;
        #10;

        data_in = 6'b110000;
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
