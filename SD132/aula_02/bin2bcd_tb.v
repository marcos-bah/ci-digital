module bin2bcd_tb;

    reg  [3:0] ebin;
    wire [7:0] sbcd;

    bin2bcd uut (
        .ebin(ebin),
        .sbcd(sbcd)
    );

    initial begin
        $display("ebin | sbcd (BCD: tens, ones)");
        for (ebin = 0; ebin < 16; ebin = ebin + 1) begin
            #5;
            $display(" %2d  ->  %1d %1d (BCD: %02h)", ebin, sbcd[7:4], sbcd[3:0], sbcd);
        end
        $finish;
    end

endmodule
