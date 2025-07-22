module FSM_MAC_Controller(
    input wire clk,
    input wire rst,
    output reg [3:0] index,      // indice de pixel/kernel (0 a 8)
    output reg mac_rst,          // sinal de reset para o MAC
    output reg done              // sinal: resultado da convolucao pronto
);

    reg [3:0] estado;
    parameter   ReseteMAC = 0, FirstIT=1, SecondIT=2, ThirdIT=3, FourthIT=4; 
    parameter   FifthIT=5, SixthIT=6, SeventhIT=7, EighthIT=8, NinethIT=9, WAIT=11, FIM=10;

    always @(estado) begin
        case (estado)
            ReseteMAC:  begin mac_rst <= 1'b1; index <= 4'd0; done <= 0; end
            FirstIT:    begin mac_rst <= 1'b0; index <= 4'd0; done <= 0; end 
            SecondIT:   begin mac_rst <= 1'b0; index <= 4'd1; done <= 0; end 
            ThirdIT:    begin mac_rst <= 1'b0; index <= 4'd2; done <= 0; end 
            FourthIT:   begin mac_rst <= 1'b0; index <= 4'd3; done <= 0; end  
            FifthIT:    begin mac_rst <= 1'b0; index <= 4'd4; done <= 0; end 
            SixthIT:    begin mac_rst <= 1'b0; index <= 4'd5; done <= 0; end 
            SeventhIT:  begin mac_rst <= 1'b0; index <= 4'd6; done <= 0; end 
            EighthIT:   begin mac_rst <= 1'b0; index <= 4'd7; done <= 0; end 
            NinethIT:   begin mac_rst <= 1'b0; index <= 4'd8; done <= 0; end
            WAIT:       begin mac_rst <= 1'b0; index <= 4'd0; done <= 0; end  
            FIM:        begin mac_rst <= 1'b0; index <= 4'd0; done <= 1; end 
            default:    begin mac_rst <= 1'b1; index <= 4'd0; done <= 0; end
        endcase
    end

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            estado <= 4'd0;
        end else begin
            case (estado)
                ReseteMAC:  estado <= FirstIT; 
                FirstIT:    estado <= SecondIT; 
                SecondIT:   estado <= ThirdIT; 
                ThirdIT:    estado <= FourthIT; 
                FourthIT:   estado <= FifthIT; 
                FifthIT:    estado <= SixthIT; 
                SixthIT:    estado <= SeventhIT; 
                SeventhIT:  estado <= EighthIT; 
                EighthIT:   estado <= NinethIT; 
                NinethIT:   estado <= WAIT; 
                WAIT:       estado <= FIM;
                FIM:        estado <= ReseteMAC; 
                default:    estado <= ReseteMAC;
            endcase
        end
    end
endmodule

