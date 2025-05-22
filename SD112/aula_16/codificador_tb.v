module codificador_tb ();
reg [2:0] bin;

wire [2:0] gray;

codificador uut(bin, gray);

integer i;

initial begin
    bin = 0;
    $monitor ("bin=%b gray=%b", bin, gray);

    for (i = 0; i < 8; i = i + 1) begin
      #10;
      bin = i;
    end
end

endmodule