module mux8x1_tb();
    reg [7:0] in;
    reg [2:0] sel; 
    wire out;

    mux8x1 uut (.in(in), .sel(sel), .out(out));

    initial begin
        in = 8'b0101_0101;
        $display("\n");
        sel = 3'b000; #10;
        sel = 3'b001; #10;
        sel = 3'b010; #10;
        sel = 3'b011; #10;
        sel = 3'b100; #10;
        sel = 3'b101; #10;
        sel = 3'b110; #10;
        sel = 3'b111; #10;
    end

    initial begin
        $monitor("Tempo: %0t | Entrada: %b | Sel %b | Saída: %b", $time ,in, sel, out);
    end

endmodule