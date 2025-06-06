module demux_tb; //observar que o uso dos () pode ser omitido
// Este exemplo apresenta o recurso de gravar mensagens em arquivo
// Nome do arquivo a ser gerado: analise_demux.txt
    integer arq_saida;

    reg entrada;
    reg [1:0] sel;
    wire saida_A, saida_B, saida_C, saida_D;
    
    initial 
     begin
        arq_saida = $fopen("analise_demux.txt"); // abrindo o arquivo
        $fdisplay (arq_saida,"#############################################################");
        $fdisplay (arq_saida,"#####      Analise dos sinais com auxilio de arquivo    #####");
        $fdisplay (arq_saida,"#############################################################");
        $fdisplay (arq_saida,"Inicio da Simulacao:");
        $fdisplay (arq_saida, "  ");
      #150;
        $fdisplay (arq_saida,"   ");
        $fdisplay (arq_saida,"######################################");
        $fdisplay (arq_saida,"#####      Fechando o arquivo    #####");
        $fdisplay (arq_saida,"######################################");
        $fclose(arq_saida); // fechando arquivo
        $stop;
     end

    always @ (entrada, sel)
      case (sel)
      2'b00:
        begin
          // Uso de numero entre %d
          // este numero controla a coluna na qual inicia a apresentacao do conteudo da variavel
          //                          observar a influencia do numero entre % e d
          $fdisplay (arq_saida,"Resultados de simulação no instante de temp: %0d",$time);
          $fdisplay (arq_saida,"Resultados de simulação no instante de temp: %2d",$time);
          $fdisplay (arq_saida,"Resultados de simulação no instante de temp: %10d",$time);
          $fdisplay (arq_saida,"Valor logico do sinal de selecao: %b",sel);
          $fdisplay (arq_saida,"Valor logico do sinal de entrada: %b",entrada);
          $fdisplay (arq_saida,"Valor logico do sinal de saida:");
          $fdisplay (arq_saida,"Sinal de saida A:%b", saida_A);
          $fdisplay (arq_saida,"Sinal de saida B:%b", saida_B);
          $fdisplay (arq_saida,"Sinal de saida C:%b", saida_C);
          $fdisplay (arq_saida,"Sinal de saida D:%b", saida_D);
        end
      2'b01:
        begin
          $fdisplay (arq_saida,"Resultados de simulação no instante de temp: %0d",$time);
          $fdisplay (arq_saida,"Valor logico do sinal de selecao: %b",sel);
          $fdisplay (arq_saida,"Valor logico do sinal de entrada: %b",entrada);
          $fdisplay (arq_saida,"Valor logico do sinal de saida:");
          $fdisplay (arq_saida,"Sinal de saida A:%b", saida_A);
          $fdisplay (arq_saida,"Sinal de saida B:%b", saida_B);
          $fdisplay (arq_saida,"Sinal de saida C:%b", saida_C);
          $fdisplay (arq_saida,"Sinal de saida D:%b", saida_D);
        end
      2'b10:
          begin
            $fdisplay (arq_saida,"Resultados de simulação no instante de temp: %0d",$time);
            $fdisplay (arq_saida,"Valor logico do sinal de selecao: %b",sel);
            $fdisplay (arq_saida,"Valor logico do sinal de entrada: %b",entrada);
            $fdisplay (arq_saida,"Valor logico do sinal de saida:");
            $fdisplay (arq_saida,"Sinal de saida A:%b", saida_A);
            $fdisplay (arq_saida,"Sinal de saida B:%b", saida_B);
            $fdisplay (arq_saida,"Sinal de saida C:%b", saida_C);
            $fdisplay (arq_saida,"Sinal de saida D:%b", saida_D);
          end
      default
         begin
           $fdisplay (arq_saida,"Resultados de simulação no instante de temp: %0d",$time);
           $fdisplay (arq_saida,"Valor logico do sinal de selecao: %b",sel);
           $fdisplay (arq_saida,"Valor logico do sinal de entrada: %b",entrada);
           $fdisplay (arq_saida,"Valor logico do sinal de saida:");
           $fdisplay (arq_saida,"Sinal de saida A:%b", saida_A);
           $fdisplay (arq_saida,"Sinal de saida B:%b", saida_B);
           $fdisplay (arq_saida,"Sinal de saida C:%b", saida_C);
           $fdisplay (arq_saida,"Sinal de saida D:%b", saida_D);
          end
      endcase
     
    initial begin
        sel = 2'b00; entrada =1'b0;
        #5  entrada = 1'b1;
        #10  entrada = 1'b0;
        #40  entrada = 1'b1;
    end
    
   always #40 sel = sel + 2'b01;

    // a conexao dos sinais é realizada pela posição
    demux DUT (saida_A, saida_B, saida_C, saida_D, entrada, sel);

endmodule
