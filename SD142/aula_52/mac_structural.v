module mac_structural (
    input wire clk, rst,
    input wire [3:0] A, B,
    output wire [15:0] result_out
);

    wire [7:0] product;
    wire [15:0] sum_out;
    reg [15:0] acc;

    WallaceTreeFD mult (
        .A(A),
        .B(B),
        .S(product)
    );

    FA #(.N(16)) adder (
        .Cin(1'b0),
        .A(acc),
        .B({8'b0, product}),
        .S(sum_out)
    );

    always @(posedge clk or posedge rst) begin
        if (rst)
            acc <= 16'b0;
        else
            acc <= sum_out;
    end

    assign result_out = acc;

endmodule
