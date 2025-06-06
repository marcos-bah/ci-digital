module count_order_bidir_tb;

	reg clk;
	reg rst;
	reg dir;
	wire [3:0] out;

	count_order_bidir uut (
    	.clk(clk),
    	.rst(rst),
    	.dir(dir),
    	.out(out)
	);

	initial begin
    	clk = 0;
    	rst = 0;
    	dir = 0;
    	#10 rst = 1;

		$display("\nContador Bidireccional - Testbench");
		$monitor("Time: %0t, Reset: %b, Direction: %b, Output: %h", $time, rst, dir, out);
	end

	always #10 clk = ~clk;

	initial begin
		#320 dir = 1; // Start counting up
	end

	initial begin
    	#680 $finish;
	end

endmodule