module ffdr (q, d, clk, rst);
    output q;
    input d, clk, rst;
    reg q;

    always @(negedge clk, posedge rst) 
      if(rst)
        q <= 1'b0;
      else q <= d;
        
endmodule
