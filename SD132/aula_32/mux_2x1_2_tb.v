module mux_2x1_2_tb;

    reg [1:0] in0, in1;
    reg sel;
    wire [1:0] out;

    mux_2x1_2 uut (
        .in0(in0),
        .in1(in1),
        .sel(sel),
        .out(out)
    );

    initial begin
        $display("\nmux_2x1_2_tb\n");

        in0 = 2'b00; in1 = 2'b11; sel = 0;
        #10 sel = 1;
        #10 in0 = 2'b10; in1 = 2'b01; sel = 0;
        #10 sel = 1;
        #10 $finish;
    end

endmodule
