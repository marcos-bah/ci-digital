module tb_serdes();
	reg clk = 0;
	reg rst = 1;
	reg load = 0;
	reg enable = 0;
	reg [7:0] data_in;
	wire [7:0] data_out;
	wire done;

	reg [8:0] i;
	reg erro;
	 
	serdes sd (.clk(clk), .rst(rst), .load(load), .data_in(data_in), .enable(enable), .data_out(data_out), .done(done));
	 
	always #5 clk = ~clk;  // Clock de 100MHz

	initial begin
		i = 0;
		erro = 0;
		for (i = 0; i <= 255; i = i + 1) begin
			data_in = i;
			#10 rst = 0;
			#10 load = 1;
			#10 load = 0;
			enable = 1;
			#130;
			enable = 0;
			rst = 1;
			if (data_in != data_out) erro = 1;
			$display("Dado Enviado: %b (%h) | Dado Recebido: %b (%h)", data_in, data_in, data_out, data_out);
			#10;
		end
		
		if (erro == 0) $display("\nNenhum Erro Encontrado.\n");
		else $display("\nPelo menos um Erro Encontrado.\n");
		$stop;
	 end
	
endmodule