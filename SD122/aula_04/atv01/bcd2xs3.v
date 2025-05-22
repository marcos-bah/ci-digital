module bcd2xs3 (
    input [3:0] bcd_8421,
    output reg [3:0] xs_3
);
    always @(*) begin
        xs_3 = bcd_8421 + 4'b0011;
    end
endmodule