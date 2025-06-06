module ffsr_tb;
  reg clk, rst;
  reg s, r;
  wire q, qn;
  
  // ffsr  (clk, rst,s,r,q,);
  ffsr dut (clk, rst, s, r, q, qn);

  initial begin
    $display("\n");
    clk = 0; rst = 1; s = 1; r = 0;
  end

  initial begin #14 rst = 0; end
  
   // geracao do clock
  always #10 clk = ~clk;

  // geracao do sinal s
  always #15 s = ~s;

  // geracao do sinal r
  initial #47  r = 1;
  initial #58  r = 0;
  initial #76  r = 1;
  initial #88  r = 0;
  initial #125 r = 1;
  initial #145 r = 0;

  always @(posedge clk) begin
		if (s && r) begin
			$display("[%0d] Erro: Estado invalido! S=1 e R=1", $time);
		end
		if (q === 1'bx) begin
			$display("[%0d] Alerta: Q esta indefinido (x)!", $time);
		end
	end
  
  initial #180 $stop;

endmodule
