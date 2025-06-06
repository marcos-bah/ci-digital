module mealy_1101_tb;

reg clk, rst, input_bit;
wire output_bit;

mealy_1101 uut (.clk(clk), .rst(rst), .input_bit(input_bit), .output_bit(output_bit));

initial begin
    $display("\nTestbench: Detector de Sequencia 1101 (Mealy)");
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    rst = 1;
    input_bit = 0;
    #12;
    rst = 0;

    input_bit = 1; #10;
    input_bit = 1; #10;
    input_bit = 0; #10;
    input_bit = 1; #10;

    input_bit = 1; #10;
    input_bit = 1; #10;
    input_bit = 0; #10;
    input_bit = 1; #10;

    input_bit = 1; #10;
    input_bit = 0; #10;
    input_bit = 0; #10;
    input_bit = 1; #10;

    #20;
    $stop;
end

endmodule
