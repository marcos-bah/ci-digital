module topo (
    input [1:0] sel,
    input [3:0] entA, entB, entC, entD,
    output [3:0] saida,
    output cout
);

wire [3:0] n0, n1;

mux41 I1(.z(n0),.a(entA),.b(entB),.sel(sel[0]));
mux41 I2(.z(n1),.a(entC),.b(entD),.sel(sel[1]));
somador I3(.soma(saida),.cout(cout),.A(n0),.B(n1),.cin(1'b0));
    
endmodule