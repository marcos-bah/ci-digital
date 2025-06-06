module frequen (
    input sinal,
    input clk,
    input rst,
    output [7:0] pulsos
);

    wire [7:0] cnt;
    wire [1:0] out;
    wire w_rst, w_load;

    count_2b c1 (.clk(sinal), .rst(rst), .out(out));
    pulso p1 (.a(out[0]), .b(w_rst));
    pulso p2 (.a(out[1]), .b(w_load));
    count_8b c8 (.clk(clk), .rst(w_rst), .out(cnt));
    reg_8b r8 (.clk(clk), .rst(rst), .load(w_load), .d(cnt), .q(pulsos));

endmodule
