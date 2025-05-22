module bin2gray_tb();
    reg [3:0] bin;
    wire [3:0] gray;

    bin2gray dut(bin, gray);

    initial begin
        $display("binario  |  gray ", bin, gray);
        $monitor("%b  %b", bin, gray);

        bin = 1; #10;
        bin = 5; #10;
        bin = 7; #10;
        bin = 9; #10;
        $stop;
    end
endmodule

