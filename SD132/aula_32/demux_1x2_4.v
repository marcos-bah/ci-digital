module demux_1x2_4 (
    input  wire sel,
    input  wire [3:0] in,
    output reg  [3:0] out0,
    output reg  [3:0] out1
);

    always @(*) begin
        case (sel)
            1'b0: begin
                out0 = in;
                out1 = 4'b0000;
            end
            1'b1: begin
                out0 = 4'b0000;
                out1 = in;
            end
        endcase
    end

endmodule
