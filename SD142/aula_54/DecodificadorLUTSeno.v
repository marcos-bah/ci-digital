module DecodificadorLUTSeno (
    input [6:0] angulo,
    output reg [3:0] address
);

always @(*) begin
    case (angulo)
        7'd0  : address = 4'd0;
        7'd10 : address = 4'd1;
        7'd20 : address = 4'd2;
        7'd30 : address = 4'd3;
        7'd40 : address = 4'd4;
        7'd50 : address = 4'd5;
        7'd60 : address = 4'd6;
        7'd70 : address = 4'd7;
        7'd80 : address = 4'd8;
        7'd90 : address = 4'd9;
        default: address = 4'd0;
    endcase
end

endmodule
