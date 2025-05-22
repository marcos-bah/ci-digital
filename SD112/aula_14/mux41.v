module mux41 (z, a, b, sel);
input sel;
input [3:0] a, b;
output [3:0] z;

reg [3:0] s;

assign z = s;

always @(a, b, sel)
begin
    if (sel) s = b;
    else          s = a; 
end
endmodule
