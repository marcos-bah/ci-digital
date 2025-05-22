module q4_4_adder_subtractor (
    input  wire [7:0] a,
    input  wire [7:0] b,
    input  wire       sel,
    output reg  [8:0] result
);

    always @(*) begin
        if (sel == 1'b0)
            result = a + b;
        else
            result = a - b;
    end

endmodule
