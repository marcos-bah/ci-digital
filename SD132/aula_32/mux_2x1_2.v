module mux_2x1_2 (
    input  wire sel,
    input  wire [1:0] in0,
    input  wire [1:0] in1,
    output wire [1:0] out
);

    assign out = (sel == 1'b0) ? in0 : in1;

endmodule
