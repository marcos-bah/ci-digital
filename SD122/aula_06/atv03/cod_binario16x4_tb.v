module cod_binario16x4_tb();
    reg [15:0] in;
    wire [3:0] out;

    cod_binario16x4 dut(in, out);

    integer i;

    initial begin
        $display("in  |  out ");
        $monitor("%b  %b", in, out);

        for (i = 0; i < 2; i=i+1) begin
            in = i; #10;
        end

        in = 16'b00100000_00000000; #10;
        in = 16'b00001000_00000000; #10;
        in = 16'b00000000_00001000; #10;
        $stop;
    end
endmodule