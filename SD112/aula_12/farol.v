module farol (
    input A, B, C, D,
    output reg FA, FB, FC, FD
);

    // always @ (A, B, C, D) begin
    //     FA = A;
    //     FB = ~A & B;
    //     FC = ~A & ~B & C;
    //     FD = ~A & ~B & ~C & D;
    // end

    always @ (*) begin
        case ({A,B,C,D}) 
            4'd0: {FA, FB, FC, FD} = 4'b0000; = 4'd0
            4'd1: {FA, FB, FC, FD} = 4'b0001;
            4'd2: {FA, FB, FC, FD} = 4'b0010;
            4'd3: {FA, FB, FC, FD} = 4'b0010;
            4'd5: {FA, FB, FC, FD} = 4'b0100;
            4'd6: {FA, FB, FC, FD} = 4'b0100;
            4'd7: {FA, FB, FC, FD} = 4'b0100;
            4'd8: {FA, FB, FC, FD} = 4'b1000;
            4'd9: {FA, FB, FC, FD} = 4'b1000;
            4'd10: {FA, FB, FC, FD} = 4'b1000;
            4'd11: {FA, FB, FC, FD} = 4'b1000;
            4'd12: {FA, FB, FC, FD} = 4'b1000;
            4'd13: {FA, FB, FC, FD} = 4'b1000;
            4'd14: {FA, FB, FC, FD} = 4'b1000;
            4'd15: {FA, FB, FC, FD} = 4'b1000;
            default: {FA, FB, FC, FD} = 4'b1000;
        endcase
    end 
    
endmodule