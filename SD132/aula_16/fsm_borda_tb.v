module fsm_borda_tb;

reg input_bit, clk, rst;
wire output_bit;

fsm_borda dut (
    .input_bit(input_bit),
    .clk(clk),
    .rst(rst),
    .output_bit(output_bit)
);

initial begin
    $display("\nTestbench para fsm_borda");
    clk = 0;
    rst = 1;
    input_bit = 0;
    #5 rst = 0;


    input_bit = 0; #6;
    input_bit = 1; #30;  
    input_bit = 0; #30;
    input_bit = 1; #10;
    input_bit = 0; #30;

    $finish;
end

always #5 clk = ~clk;

endmodule
