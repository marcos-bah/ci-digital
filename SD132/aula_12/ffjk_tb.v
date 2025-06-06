module ffjk_tb;
reg J, K, Clk, Reset;
wire Q;

//ffjk(clk, rst, j, k, q); //definicao do componente
ffjk dut (.clk(Clk), .rst(Reset), .j(J), .k(K), .q(Q));

initial begin 
		Clk = 1;
		forever #5 Clk=~Clk;
	end
	
	initial begin
		J = 0;K= 0;
		Reset = 1;
		#10;
		Reset = 0;
		#10;
		J = 0;K=1;
		#10;
		J = 1;K=0;
		#10;
		J = 1;K = 1;
		#10;
		J = 0;K=0;
		#10;
		J = 0;K = 1;
		#10;
		J = 1; K= 0;
		#10;
		J = 1;K = 1;
		#10;
	end	

    initial #120 $stop;

endmodule
