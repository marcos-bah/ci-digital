module circuito_tb ();

reg [1:0] sel;
reg [3:0] entA, entB, entC, entD;

wire cout;
wire [3:0] n0, n1, saida;

mux41 I1(.z(n0),.a(entA),.b(entB),.sel(sel[0]));
mux41 I2(.z(n1),.a(entC),.b(entD),.sel(sel[1]));
somador I3(.soma(saida),.cout(cout),.A(n0),.B(n1),.cin(1'b0));

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
