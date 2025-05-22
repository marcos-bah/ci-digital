module muxNx1_tb();
    reg [3:0] in;
    reg [1:0] sel; 
    wire out;

    muxNx1 #(4) uut (.in(in), .sel(sel), .out(out));

    initial begin
        in = 4'b0101;
        $display("\n");
        sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;
    end

    initial begin
        $monitor("Tempo: %0t | Entrada: %b | Sel %b | Saída: %b", $time ,in, sel, out);
    end

endmodule