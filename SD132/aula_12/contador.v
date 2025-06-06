module contador #(
    parameter N = 3,
    parameter a = 0,
    parameter p = (1 << N) - 1
)(
    input clk,
    input rst,
    input [2:0] opcao,
    output reg [N-1:0] q
);

    reg [N-1:0] next_q;

    always @(*) begin
        case (opcao)
            3'b000: next_q = (q == p) ? a : q + 1;
            3'b001: next_q = (q == a) ? p : q - 1;
            3'b010: next_q = (q != p) ? q + 1 : q;
            3'b011: next_q = (q != a) ? q - 1 : q;
            3'b100: next_q = (q == p) ? a : q + 1;
            3'b101: next_q = (q == a) ? p : q - 1;
            3'b110: next_q = q;
            default: next_q = q;
        endcase
    end

    wire [N-1:0] ff_out;
    wire [N-1:0] enables;

    assign enables[0] = 1'b1;
    genvar i;
    generate
        for (i = 1; i < N; i = i + 1) begin
            assign enables[i] = &ff_out[i-1:0];
        end
    endgenerate

    generate
        for (i = 0; i < N; i = i + 1) begin : bits
            contador_bit u (
                .clk(clk),
                .rst(rst),
                .enable(enables[i]),
                .q(ff_out[i])
            );
        end
    endgenerate

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            if (opcao == 3'b110)
                q <= a;
            else
                q <= 0;
        end else begin
            q <= next_q;
        end
    end

endmodule
