module bcd_to_xs3_fsm_tb;

    reg clk;
    reg rst;
    reg in;
    wire out;
    wire [3:0] s_xs3_out, s_bcd_in;

    bcd_to_xs3_fsm dut (
        .clk(clk),
        .rst(rst),
        .in(in),
        .out(out),
        .s_xs3_out(s_xs3_out),
        .s_bcd_in(s_bcd_in)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 1;
        in = 0;
        #12 rst = 0;

        #10;

        in = 0; #10;
        in = 0; #10;
        in = 0; #10;
        in = 1; #10;
        #10; //calcula
        #40; //saida
        rst = 1; #10;
        rst = 0; #10;

        $finish;
    end

endmodule
