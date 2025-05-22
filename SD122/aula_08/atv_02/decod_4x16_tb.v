module decod_4x16_tb();
    reg [3:0] in; 
    wire [15:0] out;

    decod_4x16 uut (.in(in), .out(out));

    initial begin
        $display("\n");
        in = 4'b0000; #10;
        in = 4'b0001; #10;
        in = 4'b0010; #10;
        in = 4'b0011; #10;
        in = 4'b0100; #10;
        in = 4'b0101; #10;
        in = 4'b0111; #10;
    end

    initial begin
        $monitor("Tempo: %0t | Entrada: %b | Saída: %b", $time ,in, out);
    end

endmodule