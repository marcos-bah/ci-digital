module demux1xN_tb ();
    reg in;
    reg [2:0] sel;
    wire [7:0] out;

    demux1xN #(8) uut (.in(in), .sel(sel), .out(out));

    initial begin
        $monitor("Entrada: %b | Seletora: %b | Saída: %b", in, sel, out);
        in = 1; sel = 3'b000; #10;
        in = 1; sel = 3'b001; #10;
        in = 1; sel = 3'b010; #10;
        in = 1; sel = 3'b011; #10;
        in = 1; sel = 3'b100; #10;
        in = 1; sel = 3'b101; #10;
        in = 1; sel = 3'b110; #10;
        in = 1; sel = 3'b111; #10;

        in = 0; sel = 3'b000; #10;
        in = 0; sel = 3'b001; #10;
        in = 0; sel = 3'b010; #10;
        in = 0; sel = 3'b011; #10;
        in = 0; sel = 3'b100; #10;
        in = 0; sel = 3'b101; #10;
        in = 0; sel = 3'b110; #10;
        in = 0; sel = 3'b111; #10;
    end
    
endmodule