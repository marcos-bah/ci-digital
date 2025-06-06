module count_order_load_final_tb;

	reg clk;
	reg rst;
	reg dir;
	reg load;
	reg [3:0] vf;
	wire [3:0] out;

	count_order_load_final uut (
		.clk(clk),
		.rst(rst),
		.dir(dir),
		.load(load),
		.vf(vf),
		.out(out)
	);

	always #10 clk = ~clk;

	initial begin
		clk = 0;
		rst = 0;
		dir = 0;
		load = 0;
		vf = 4'h9;

		$display("\nContador Bidirecional com Load - Testbench");
		$monitor("Time: %0t | rst: %b | dir: %b | load: %b | vf: %h | out: %h", 
		         $time, rst, dir, load, vf, out);

		#10 load = 1;
		#10 rst = 1;
		#20 load = 0;

		#100 dir = 1;
		#100 dir = 0;

		#20 rst = 0;
		#20 rst = 1;

		#100 $finish;
	end

endmodule
