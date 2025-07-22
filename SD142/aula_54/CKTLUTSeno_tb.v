module CKTLUTSeno_tb();

reg [6:0] angulo;
wire [15:0] seno;
integer i = 0;

CKTLUTSeno DUT(
    .angulo(angulo),
    .seno(seno)
);

initial begin
    for (i = 0; i < 91; i = i + 1)
        #10 angulo = i;
end

endmodule
