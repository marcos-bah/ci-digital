module count_random_tb;

    reg clk;
    reg rst;
    wire [3:0] out;

    count_random uut (
        .clk(clk),
        .rst(rst),
        .out(out)
    );

    initial begin
        clk = 0;
        rst = 0;
        #10 rst = 1;
    end

    always #10 clk = ~clk;

    initial begin
        #340 $finish;
    end

endmodule
