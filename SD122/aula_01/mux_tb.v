module mux_tb();
reg [1:0] D; 
reg sel;
wire y;

//inclua aqui a declaracao da instancia do dispositivo sob teste
//
mux4 dut (.D(D), .sel(sel), .y(y));

always begin #1 D[0] = !D[0]; end
always begin #2 D[1] = !D[1]; end
always begin #4 sel = !sel; end

initial begin
	sel = 1'b0;
	D = 2'd0;
	#8 $stop;
end

endmodule