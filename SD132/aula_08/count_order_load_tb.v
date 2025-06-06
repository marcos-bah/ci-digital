module count_order_load_tb;

	reg clk;
	reg rst;
	reg dir;
	reg load;
	reg [3:0] vi;
	wire [3:0] out;

	count_order_load uut (
    	.clk(clk),
    	.rst(rst),
    	.dir(dir),
		.load(load),
		.vi(vi),
    	.out(out)
	);

	initial begin
    	clk = 0;
    	rst = 0;
    	dir = 0;
    	load = 1;
    	vi = 4'h7;
    	#25 rst = 1;
		#45 load = 0;

		$display("\nContador Bidireccional Com Load - Testbench");
		$monitor("Time: %0t, Reset: %b, Direction: %b, Load: %b, Output: %h", $time, rst, dir, load, out);
	end

	always #10 clk = ~clk;

	initial begin
		#340 dir = 1; // Start counting up
	end

	initial begin
    	#680 $finish;
	end

endmodule