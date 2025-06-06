module contador_bit (
    input clk,
    input rst,
    input enable,
    output q
);

    wire j = 1'b1;
    wire k = 1'b1;

    ffjk ff (
        .clk(clk),
        .rst(rst),
        .j(enable ? j : 1'b0),
        .k(enable ? k : 1'b0),
        .q(q)
    );

endmodule
