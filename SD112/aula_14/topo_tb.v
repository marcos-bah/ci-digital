module topo_tb ();

reg [1:0] sel;
reg [3:0] entA, entB, entC, entD;

wire cout;
wire [3:0] saida;

topo uut(.sel(sel), .entA(entA), .entB(entB), .entC(entC), .entD(entD), .saida(saida), .cout(cout));

initial
  begin
       entA = 4'b0001; entB = 4'b0010;
       entC = 4'b0100; entD = 4'b1000;
       sel=2'b00;
       #20 sel = 2'b01;
       #20 sel = 2'b10; 
       #20 sel = 2'b11;       
  end

initial #80 $stop;

endmodule 
