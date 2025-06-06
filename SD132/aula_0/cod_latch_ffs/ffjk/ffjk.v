module ffjk(clk, rst, j, k, q);
input clk,j,k;
output reg q;

always @ (posedge clk, posedge rst)
    if (rst) q <= 0;
       else
        begin
            case({j,k})
              2'b00:   q <= q;
              2'b01:   q <= 0;
              2'b10:   q <= 1;
              2'b11:   q <= ~q;
              default: q <= q;
            endcase
        end
           
endmodule