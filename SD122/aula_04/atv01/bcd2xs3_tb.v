module bcd2xs3_tb();
reg [3:0] bcd_8421;
wire [3:0] xs_3;

    bcd2xs3 dut(bcd_8421, xs_3);

    initial begin
        bcd_8421 = 1; #10;
        bcd_8421 = 5; #10;
        bcd_8421 = 7; #10;
        bcd_8421 = 9; #10;
        $stop;
    end
endmodule

