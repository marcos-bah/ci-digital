module demux_2x1_4_tb;

    reg [3:0] in;
    reg sel;
    wire [3:0] out0, out1;

    demux_2x1_4 uut (
        .in(in),
        .sel(sel),
        .out0(out0),
        .out1(out1)
    );

    initial begin
        $display("\ndemux_2x1_4_tb\n");

        in = 4'b0000; sel = 0;
        #10 sel = 1;
        #10 in = 4'b1111; sel = 0;
        #10 sel = 1;
        #10 $finish;
    end

endmodule
