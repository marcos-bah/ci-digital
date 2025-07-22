module tb_convolution_pipeline_rolled;
  reg clk;
  reg rst;
  reg [7:0] pixel[0:14399];         // 120x120 = 14400 pixels
  wire [31:0] resultado;            // Resultado da convolucao
  wire done;
  reg [7:0] pixel_0, pixel_1, pixel_2;
  reg [7:0] pixel_3, pixel_4, pixel_5;
  reg [7:0] pixel_6, pixel_7, pixel_8;

  integer pgm_file;
  integer i, j;
  integer r2;
  
  // Instancia do DUT (Design Under Test)
  convolution_pipeline_mac_fsm dut (
    .pixel_0(pixel_0),
    .pixel_1(pixel_1),
    .pixel_2(pixel_2),
    .pixel_3(pixel_3),
    .pixel_4(pixel_4),
    .pixel_5(pixel_5),
    .pixel_6(pixel_6),
    .pixel_7(pixel_7),
    .pixel_8(pixel_8),
    .clk(clk),
    .rst(rst),
    .resultado(resultado),
    .done(done)
  );

  initial begin 
    load_pgm_1("/home/aluno/Downloads/4.pgm");
    // Salvar imagem original
    pgm_file = $fopen("imagem_original.pgm", "w");
    $fwrite(pgm_file, "P5\n120 120\n255\n");
    for (i = 0; i < 14400; i = i + 1)
      $fwrite(pgm_file, "%c", pixel[i]);
    $fclose(pgm_file);
  end

  // Clock
  always #5 clk = ~clk;

  initial begin
    clk = 0;
    rst = 1;
    #10 rst = 0;
    
    // Aplicar convolucao com padding
    $display("Aplicando convolucao com padding (stride=1)...");
    apply_convolution_with_padding();
    #100 $finish;
  end

  task load_pgm_1(input [1023:0] filename);
    integer fd, c, count;
    integer header_count;
    reg [7:0] dummy;
    begin
        fd = $fopen(filename, "rb");
        if (!fd) begin
        $display("Erro ao abrir %s", filename);
        $finish;
        end
        // Pula exatamente 3 linhas do cabecalho
        header_count = 0;
        while (header_count < 3 && !$feof(fd)) begin
        dummy = $fgetc(fd);
        if (dummy == "\n") header_count = header_count + 1;
        end
        for (count = 0; count < 14400; count = count + 1)
        pixel[count] = $fgetc(fd);
        $fclose(fd);
    end
  endtask

  // Aplica convolucao com zero-padding e stride=1, mantendo 120x120
  task apply_convolution_with_padding;
    integer i, j;
    reg [7:0] window[0:8];
    reg [7:0] padded[0:121*121-1]; // Imagem com padding (122x122)
    reg [7:0] out_pixel;
    integer filtered_file;
    reg [7:0] filtered[0:14399];
    integer delay_counter;
    integer pi, pj;
    localparam THRESHOLD_LOW = 64000;
    localparam THRESHOLD_HIGH = 65250;

    begin
      delay_counter = 0;
      // Criar imagem com zero-padding (122x122)
      for (i = 0; i < 122; i = i + 1) begin
        for (j = 0; j < 122; j = j + 1) begin
          if (i == 0 || j == 0 || i == 121 || j == 121)
            padded[i*122 + j] = 0; // Padding
          else
            padded[i*122 + j] = pixel[(i-1)*120 + (j-1)];
        end
      end
      // Salvar imagem com padding
      pgm_file = $fopen("imagem_original_padded.pgm", "w");
      if (!pgm_file) begin
        $display("Erro ao abrir imagem_original_padded.pgm");
        disable apply_convolution_with_padding;
      end
      $fwrite(pgm_file, "P5\n122 122\n255\n");
      for (i = 0; i < 122*122; i = i + 1)
        $fwrite(pgm_file, "%c", padded[i]);
      $fclose(pgm_file);

      // Abrir arquivo para imagem filtrada
      pgm_file = $fopen("imagem_filtrada.pgm", "w");
      if (!pgm_file) begin
        $display("Erro ao abrir imagem_filtrada.pgm");
        disable apply_convolution_with_padding;
      end
      // Cabecalho do PGM
      $fwrite(pgm_file, "P5\n120 120\n255\n");

      for (i = 1; i <= 120; i = i + 1) begin
        for (j = 1; j <= 120; j = j + 1) begin
          // Janela 3x3
          window[0] = padded[(i-1)*122 + (j-1)];
          window[1] = padded[(i-1)*122 + (j)];
          window[2] = padded[(i-1)*122 + (j+1)];
          window[3] = padded[(i)*122 + (j-1)];
          window[4] = padded[(i)*122 + (j)];
          window[5] = padded[(i)*122 + (j+1)];
          window[6] = padded[(i+1)*122 + (j-1)];
          window[7] = padded[(i+1)*122 + (j)];
          window[8] = padded[(i+1)*122 + (j+1)];
          // Atribuir ao DUT
          pixel_0 = window[0];
          pixel_1 = window[1];
          pixel_2 = window[2];
          pixel_3 = window[3];
          pixel_4 = window[4];
          pixel_5 = window[5];
          pixel_6 = window[6];
          pixel_7 = window[7];
          pixel_8 = window[8];

          // Espera o done do DUT
          @(posedge done)
          #1; // garante estabilidade do resultado

          //Define os pixels em 0 (preto), 255 (branco)
          //ou 128 (cinza) de acordo com a saida do circuito
          //dut para visualizacao correta da deteccao de borda
          //de zoom no arquivo de imagem de saida para visualizar
          //a borda em cinza.
          if (resultado >= THRESHOLD_HIGH) begin
            out_pixel = 255;        // preto --> borda forte
          end else if (resultado >= THRESHOLD_LOW) begin
            out_pixel = 128;      // cinza --> interior do circulo
          end else begin
            out_pixel = 255;      // branco --> fundo
          end
          filtered[(i-1)*120 + (j-1)] = out_pixel;

        end
      end
      // Conteudo da imagem filtrada
      for (i = 0; i < 14400; i = i + 1)
        $fwrite(pgm_file, "%c", filtered[i]);
      $fclose(pgm_file);
    end
  endtask

  

endmodule
