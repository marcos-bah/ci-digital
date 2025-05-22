module prioridade16x4_tb();
    reg [15:0] in;
    wire [3:0] out;

    prioridade16x4 dut(in, out);

    integer i;

    initial begin
        $display("in  |  out ");
        $monitor("%b  %b", in, out);

        for (i = 0; i < 4; i=i+1) begin
            in = i; #10;
        end

        in = 16'b001xxxxxxxxxxxxx; #10;
        in = 16'b00001xxxxxxxxxxx; #10;
        in = 16'b0000000000001xxx; #10;
        $stop;
    end
endmodule