module count_2b_tb;

reg clk, rst;
wire [1:0] out;

count_2b DUT (
    .clk(clk),
    .rst(rst),
    .out(out)
);

initial begin
    $display("\ncount_2b_tb");

    clk = 0;
    rst = 1;
    #5 rst = 0;

    #100 $stop;
end

always #5 clk = ~clk;

endmodule
