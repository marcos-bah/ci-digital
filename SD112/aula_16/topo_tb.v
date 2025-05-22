module topo_tb ();

reg [2:0] X, Y, Z;
reg SEL;

wire [2:0] s_n1, s_n2, S;

topo uut(X, Y, Z, SEL, s_n1, s_n2, S);

integer i;

initial begin
    X = 3'b001;
    Y = 3'b010;
    Z = 3'b100;
    SEL = 1'b0;

    $monitor ("X=%d Y=%d Z=%d SEL=%b s_n1=%b s_n2=%b S=%b", X, Y, Z, SEL, s_n1, s_n2, S);

    for (i = 0; i < 5; i = i + 1) begin
      #40 
      SEL = ~SEL;
    end
end

endmodule