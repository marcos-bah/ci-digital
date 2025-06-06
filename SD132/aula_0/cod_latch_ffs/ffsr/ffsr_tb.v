`timescale 1ns / 1ps
module ffsr_tb;
  reg clk, rst;
  reg s, r;
  wire q;
  
  // ffsr  (clk, rst,s,r,q,);
  ffsr dut (clk, rst, s, r, q);

  initial begin
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
  
  initial #180 $stop;

endmodule
