module pwm (
    input clk, rst, load,
    input [3:0] duty,
    output out
);
    
wire [3:0] cnt, reff;

count_4b c4 (.clk(clk), .rst(rst), .out(cnt));

reg_4b r4 (.clk(clk), .rst(rst), .load(load), .d(duty), .q(reff));

comparador_4b cmp4 (.a(cnt), .b(reff), .out(out));
endmodule