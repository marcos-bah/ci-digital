module fft_tb;
reg T,Clk,Reset;
wire Q;
TFF uut (.T(T),.Clk(Clk),.Reset(Reset),.Q(Q));

initial begin 
		Clk = 1;
		forever #5 Clk=~Clk;
	end
	
	initial begin
		T = 0;
		Reset = 1;
		#10;
		Reset = 0;
		#10;
		T = 0;
		#10;
		T = 1;
		#10;
		T = 0;
		#10;
		T = 1;
		#10;
		T = 0;
		#10;
		T = 1;
		#10;
		T = 0;
		#10;
		T = 1;
		#10;
	end

	always @(posedge Clk) begin
		if (S && R) begin
			$display("[%0d] Erro: Estado invalido! S=1 e R=1", $time);
		end
		if (Q === 1'bx) begin
			$display("[%0d] Alerta: Q esta indefinido (x)!", $time);
		end
	end

	initial #120 $stop;
	
endmodule