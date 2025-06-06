module fft(
    input T,
    input Clk,
    input Reset,
    output reg Q
    );

    always@(negedge Clk or posedge Reset)
    if(Reset)
       Q <= 1'b0;
    else
       if(T) Q <= ~ Q;   
endmodule
