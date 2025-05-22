module somador_tb ();
reg cin;
reg [2:0] A, B;

wire cout;
wire [2:0] soma;

somador uut(soma, cout, A, B, cin);

integer i;

initial begin
    A = 0;
    B = 0;
    cin = 0;

    $monitor ("a=%d b=%d sum=%d cout=%b", A, B, soma, cout);

    for (i = 0; i < 5; i = i + 1) begin
      #10 A = $random % 16;
      B = $random % 16;
    end
end

endmodule