module ffsr (
  input clk, rst,
  input s,r,
  output reg q
  );
  
  always@(posedge clk, posedge rst) begin
    if(rst) q <= 0;
    else begin
      case({s,r})
        2'b00: q <= q;    // sem mudanca
        2'b01: q <= 1'b0; // reset
        2'b10: q <= 1'b1; // set
        2'b11: q <= 1'bx; // entradas invalidas
      endcase
    end
  end
  
endmodule
