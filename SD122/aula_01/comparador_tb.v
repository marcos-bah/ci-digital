module comparador_tb();
reg [1:0] x1, x2; 
wire y;

comparador dut (.x1(x1), .x2(x2), .y(y));

initial begin
	x1 = 2'b00;
	x2 = 2'b01;
    #10;
    x1 = 2'b01;
	x2 = 2'b01;
    #10;
    x1 = 2'b11;
	x2 = 2'b01;
	#8 $stop;
end

endmodule