module serdes(
	input wire clk,
	input wire rst,
	input wire load,
	input wire [7:0] data_in,
	input wire enable,
	output wire [7:0] data_out,
	output wire done
);

	wire serial;
	 
	serializer s (.clk(clk), .rst(rst), .load(load), .data_in(data_in), .serial_out(serial));
	deserializer d (.clk(clk), .rst(rst), .serial_in(serial), .enable(enable), .data_out(data_out), .done(done));

endmodule
