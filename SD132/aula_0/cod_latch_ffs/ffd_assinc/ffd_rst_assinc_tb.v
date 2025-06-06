module ffd_rst_assinc_tb;
reg D,Clk,Reset;
wire Q;

ffd_rst_assinc DUT (.D(D),.Clk(Clk),.Reset(Reset),.Q(Q));
	
initial begin 
		Clk = 0;
		forever #5 Clk=~Clk;
	end
	
	initial begin
		// Inicializa as entradas
		D = 0;
		Reset = 1;
		#10;
		Reset = 0;
		#10;
		D = 1;
		#10;
		D = 0;
		#10;
		D = 1;
		#10;
		D = 1;
		#10;
		D = 0;
		#10;
		D = 1;
		#10;
		D = 0;
		#10;
	end 
                
    initial begin #120 $stop end
   
endmodule
