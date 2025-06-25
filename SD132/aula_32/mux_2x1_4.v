module mux_2x1_4 (
    input  wire sel,
    input  wire [3:0] in0,
    input  wire [3:0] in1,
    output wire [3:0] out
);

    assign out = (sel == 1'b0) ? in0 : in1;

endmodule
