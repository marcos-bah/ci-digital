module contador_saldo (
    input wire moeda,
    input wire rst,
    output reg [3:0] saldo
);

initial saldo = 0;

always @(posedge moeda or posedge rst) begin
    if (rst)
        saldo <= 0;
    else
        saldo <= saldo + 1;
end

endmodule
