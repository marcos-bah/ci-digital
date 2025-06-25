module mux_2x1_4_tb;

    reg [3:0] in0, in1;
    reg sel;
    wire [3:0] out;

    mux_2x1_4 uut (
        .in0(in0),
        .in1(in1),
        .sel(sel),
        .out(out)
    );

    initial begin
        $display("\nmux_2x1_4_tb\n");

        in0 = 4'b0000; in1 = 4'b1111; sel = 0;
        #10 sel = 1;
        #10 in0 = 4'b1010; in1 = 4'b0101; sel = 0;
        #10 sel = 1;
        #10 $finish;
    end

endmodule
