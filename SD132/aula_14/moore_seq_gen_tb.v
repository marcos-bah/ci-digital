module moore_seq_gen_tb;

reg clk;
reg rst;
reg input_bit;
wire output_bit;

moore_seq_gen uut (
    .clk(clk),
    .rst(rst),
    .input_bit(input_bit),
    .output_bit(output_bit)
);

initial begin
    clk = 0;
end

always #5 clk = ~clk;

initial begin
    rst = 1; input_bit = 0;
    #10;
    rst = 0;
    #10;

    input_bit = 1;
    #10;
    input_bit = 0;

    #80;

    input_bit = 1;
    #10;
    input_bit = 0;

    #80;

    $finish;
end

endmodule
