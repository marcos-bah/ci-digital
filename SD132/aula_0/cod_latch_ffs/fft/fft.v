module fft(
    input T,
    input Clk,
    input Reset,
    output reg Q
    );

    always@(posedge Clk or negedge Reset)
    if(Reset)
       Q<=1'b0;
    else
       if(T)
       Q<=~Q;   
endmodule
