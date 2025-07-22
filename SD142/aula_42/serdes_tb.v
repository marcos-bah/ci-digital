module serdes_tb();

    parameter WIDTH = 8;

	reg clk;
	reg rst;
	reg load;
	reg enable;
	reg [WIDTH-1:0] data_in;
	wire [WIDTH-1:0] data_out;
	wire done, ready_tx, ready_rx;
	wire paridade_error;

	reg [WIDTH:0] i;
	reg erro;
	 
	serdes #( .DATA_WIDTH(WIDTH) ) sd (
		.clk(clk), 
		.rst(rst), 
		.load(load), 
		.data_in(data_in), 
		.enable(enable), 
		.data_out(data_out), 
		.done(done),
		.paridade_error(paridade_error),
		.ready_tx(ready_tx),
		.ready_rx(ready_rx)
	);
	 
	always #5 clk = ~clk;  // Clock de 100MHz

	initial begin
		$display("\n");
        clk = 0; rst = 1; load = 0; enable = 0;
		i = 0;
		erro = 0;
		for (i = 0; i <= (1 << WIDTH) - 1; i = i + 1) begin
			data_in = i;
			#10 rst = 0;
			#10 load = 1;
			#10 load = 0;
			enable = 1;
			wait (done);
			enable = 0;
			rst = 1;
			if (data_in != data_out || paridade_error == 1) erro = 1;
			$display("Dado Enviado: %b (%h) | Dado Recebido: %b (%h) | Paridade Par Error: %b", data_in, data_in, data_out, data_out, paridade_error);
			wait (ready_tx & ready_rx);
		end
		
		if (erro == 0) $display("\nNenhum Erro Encontrado.\n");
		else $display("\nPelo menos um Erro Encontrado.\n");
		$stop;
	end
	
endmodule
