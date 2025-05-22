module teclado2xs3_tb();
    reg [15:0] in;
    wire [3:0] out;

    teclado2xs3 dut(in, out);

    integer i;

    initial begin
        $display("in  |  out ");
        $monitor("%b  %b", in, out);

        for (i = 0; i < 2; i=i+1) begin
            in = i; #10;
        end

        in = 10'b0000000001; #10;
        in = 10'b0000000010; #10;
        $stop;
    end
endmodule