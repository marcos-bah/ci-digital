module LUT_Seno (
    input [3:0] address,
    output [15:0] seno
);

reg [15:0] memoria [0:9];

initial begin
    memoria[0] = 16'h0000;
    memoria[1] = 16'h1639;
    memoria[2] = 16'h2BC7;
    memoria[3] = 16'h4000;
    memoria[4] = 16'h52A7;
    memoria[5] = 16'h620F;
    memoria[6] = 16'h6EB9;
    memoria[7] = 16'h7846;
    memoria[8] = 16'h7BEF;
    memoria[9] = 16'h8000;
end

assign seno = memoria[address];

endmodule
