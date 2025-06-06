module moore_tb;

reg clk;
reg input_bit;
reg rst;
wire output_bit;

moore uut (.clk(clk), .input_bit(input_bit), .rst(rst), .output_bit(output_bit));

reg [15:0] sequence;
integer i;

initial begin
    $display("\nTestbench para detecção da sequência 1101 usando máquina de Moore");

    clk = 0;
    rst = 1;
    input_bit = 0;
    sequence = 0;
    #5 rst = 0;

    sequence = 16'b0001101101101110;

    for (i = 15; i >= 0; i = i - 1) begin
        input_bit = sequence[i];
        #5 clk = 1;
        #5 clk = 0;
    end

    #10 $finish;
end

endmodule
