 //Circuito aplica convolucao com kernel detector de borda a imagem
 //atraves de um pipeline enrolado (faz cada multiplicacao/soma
 //de cada convolucao em um clico do loop) --> (menor desempenho em termos de
 //velocidade - maior latencia, menor throuput), porem utiliza menos
 //recursos de hardware - convolucao feita com apenas um MAC (multiplica
 //e acumula) e uma FSM controlando o loop
 //Apenas uma imagem pode ser aplicada ao circuito ate que seja flagado done.
module convolution_pipeline_mac_fsm (
    input [7:0] pixel_0, pixel_1, pixel_2, 
    input [7:0] pixel_3, pixel_4, pixel_5,
    input [7:0] pixel_6, pixel_7, pixel_8,
    input clk,
    input rst,
    output [31:0] resultado,
    output done
);

    reg [7:0] kernel [0:8];
    reg [7:0] pixels [0:8];

    wire [3:0] index;
    wire mac_rst;
    //wire done;
    reg [7:0] A, B;
    wire [31:0] mac_result;

    // Instancias
    FSM_MAC_Controller fsm_inst (
        .clk(clk),
        .rst(rst),
        .index(index),
        .mac_rst(mac_rst),
        .done(done)
    );

    MAC mac_inst (
        .A(A),
        .B(B),
        .clk(clk),
        .rst(mac_rst),
        .Result(mac_result)
    );

    always @(*) begin
        A = pixels[index];
        B = kernel[index];
    end

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            //resultado <= 16'd0;

            // Inicializa pixels e kernel
            pixels[0] <= 8'd0; pixels[1] <= 8'd0; pixels[2] <= 8'd0;
            pixels[3] <= 8'd0; pixels[4] <= 8'd0; pixels[5] <= 8'd0;
            pixels[6] <= 8'd0; pixels[7] <= 8'd0; pixels[8] <= 8'd0;

            kernel[0] <= 8'd1;   kernel[1] <= 8'd1;   kernel[2] <= 8'd1;
            kernel[3] <= 8'd1;   kernel[4] <= -8'sd8; kernel[5] <= 8'd1;
            kernel[6] <= 8'd1;   kernel[7] <= 8'd1;   kernel[8] <= 8'd1;

        end else begin
            // Carrega os pixels continuamente
            pixels[0] <= pixel_0; pixels[1] <= pixel_1; pixels[2] <= pixel_2;
            pixels[3] <= pixel_3; pixels[4] <= pixel_4; pixels[5] <= pixel_5;
            pixels[6] <= pixel_6; pixels[7] <= pixel_7; pixels[8] <= pixel_8;

            //if (done) resultado <= mac_result[15:0];
        end
    end

    assign resultado = done ? mac_result[31:0] : 0;

endmodule

