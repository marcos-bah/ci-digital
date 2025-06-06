module random_tb;
    reg clk, rst;
    wire [3:0] s;

    random dut (clk, rst, s);

    initial begin
        clk = 0; rst = 1;
    end

    initial begin #25 rst = 0; end

    always #10 clk = ~clk;

    initial #270 $stop;
endmodule