module mac_structural_fsm (
    input wire clk, rst,
    input wire [3:0] A, B,
    output wire [15:0] result_out
);

    wire [7:0] produto;
    wire done;
    wire [15:0] soma;
    reg [15:0] acc;

    mult_fsm mult (
        .clk(clk),
        .rst(rst),
        .A(A),
        .B(B),
        .produto(produto),
        .done(done)
    );

    somador_carry_look_ahead_param #(.N(16)) adder (
        .A(acc),
        .B({8'b0, produto}),
        .C_in(1'b0),
        .S(soma)
    );

    always @(posedge clk or posedge rst) begin
        if (rst)
            acc <= 16'b0;
        else if (done)
            acc <= soma;
    end

    assign result_out = acc;

endmodule
