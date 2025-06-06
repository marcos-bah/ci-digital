module conversorbcd (
    input  [3:0] ebin,     
    output reg [7:0] sbcd  
);

    always @(*) begin
        case (ebin)
            4'd0:  sbcd = 8'h00;  
            4'd1:  sbcd = 8'h01;
            4'd2:  sbcd = 8'h02;
            4'd3:  sbcd = 8'h03;
            4'd4:  sbcd = 8'h04;
            4'd5:  sbcd = 8'h05;
            4'd6:  sbcd = 8'h06;
            4'd7:  sbcd = 8'h07;
            4'd8:  sbcd = 8'h08;
            4'd9:  sbcd = 8'h09;
            4'd10: sbcd = 8'h10;  
            4'd11: sbcd = 8'h11;
            4'd12: sbcd = 8'h12;
            4'd13: sbcd = 8'h13;
            4'd14: sbcd = 8'h14;
            4'd15: sbcd = 8'h15;
            default: sbcd = 8'h00; 
        endcase
    end

endmodule
