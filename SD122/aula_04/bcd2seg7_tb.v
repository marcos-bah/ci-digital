module bcd2seg7_tb();
    reg [3:0] bcd;
    wire [6:0] seg7;

    bcd2seg7 dut(bcd, seg7);

    integer i;

    initial begin
        $display("bcd  |  seg7 ");
        $monitor("%b  %b", bcd, seg7);

        for (i = 0; i < 16; i=i+1) begin
            bcd = i; #10;
        end
        $stop;
    end
endmodule