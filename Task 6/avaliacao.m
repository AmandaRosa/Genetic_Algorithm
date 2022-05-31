%Esta funcao visa verificar se as posições seguem as regras de trajetoria
%de um cavalo no xadrez


function [Avaliacao2] = avaliacao (Pop_inicial, Individuos)

Pontuacao = zeros(1,64);
Geracao = Pop_inicial;

%vetor com as regras do cavalo
Posicao = [-6  +6  -10  +10  -15  +15 -17  +17];

%regras de exceções para as bordas

%linha 1 de 9,17,25,33,41,49
Casa_linha1 = [9 17 25 33 41 49];
Posicao_ex1 = [-6 +10 -15 +17];

%linha 2 de 3,4,5,6
Casa_linha2 = [3 4 5 6];
Posicao_ex2 = [+6 +10 +15 +17];

% para 1
Posicao_ex3 = [+10 +17];

%para 2
Posicao_ex4 = [+10 +15 +17];

%para 7
Posicao_ex5 = [+6 +15 +17];

%para 8
Posicao_ex6 = [+6 +15];

%para linha 3 16,24,32,40,48,56
Casa_linha3 = [16 24 32 40 48 56];
Posicao_ex7 = [+6 -10 +15 -17];

%linha 4 de 59,60,61,62
Casa_linha4 = [ 59 60 61 62];
Posicao_ex8 = [-6 -10 -15 -17];

%para 57
Posicao_ex9 = [-6 -15];

%para 58
Posicao_ex10 = [-6 -15 -17];

%para 63
Posicao_ex11 = [-10 -15 -17];

%para 64
Posicao_ex12 = [-10 -17];

%vetor bordas sem contar os cantos
Bordas = [3 4 5 6 9 17 25 33 41 49 16 24 32 40 48 56];

%percorrer cada linha e verificar se a posicao subsequente corresponde às
%regras do cavalo (movimento em L)
for i = 1:Individuos
    for j = 1:63
      
        %tratar exceções individuais - cantos do tabuleiro
        if(Geracao(i,j) == 1)
            
            for x = 1:2   
                    if(Geracao(i,j+1) == Geracao(i,j) + Posicao_ex3(1,x))

                        Pontuacao(i,j) = 1;
                    end
               end
            
        elseif(Geracao(i,j) == 2)
            
            for x = 1:3  
                    if(Geracao(i,j+1) == Geracao(i,j) + Posicao_ex4(1,x))

                        Pontuacao(i,j) = 1;
                    end
               end
            
        elseif(Geracao(i,j) == 7)
            
            for x = 1:3   
                    if(Geracao(i,j+1) == Geracao(i,j) + Posicao_ex5(1,x))

                        Pontuacao(i,j) = 1;
                    end
               end
            
        elseif(Geracao(i,j) == 8)
            
            for x = 1:2   
                    if(Geracao(i,j+1) == Geracao(i,j) + Posicao_ex6(1,x))

                        Pontuacao(i,j) = 1;
                    end
               end
            
        elseif(Geracao(i,j) == 57)
            
            for x = 1:2   
                    if(Geracao(i,j+1) == Geracao(i,j) + Posicao_ex9(1,x))

                        Pontuacao(i,j) = 1;
                    end
               end
            
        elseif(Geracao(i,j) == 58)
            
            for x = 1:3   
                    if(Geracao(i,j+1) == Geracao(i,j) + Posicao_ex10(1,x))

                        Pontuacao(i,j) = 1;
                    end
               end
            
        elseif(Geracao(i,j) == 63)
            
            for x = 1:3   
                    if(Geracao(i,j+1) == Geracao(i,j) + Posicao_ex11(1,x))

                        Pontuacao(i,j) = 1;
                    end
               end
            
        elseif(Geracao(i,j) == 64)
            
            for x = 1:2   
                    if(Geracao(i,j+1) == Geracao(i,j) + Posicao_ex12(1,x))

                        Pontuacao(i,j) = 1;
                    end
               end
            
              
        else %a casa não está nos cantos, agora verificar bordas
            
         for w = 1:16
             if (Geracao(i,j) == Bordas(1,w)) %tratar bordas  

                 for x = 1:6  
                    if(Geracao(i,j) == Casa_linha1(1,x)) %tratar exceção linha 1
                        
                        for x = 1:4
                            if(Geracao(i,j+1) == Geracao(i,j) + Posicao_ex1(1,x))
                                
                                Pontuacao(i,j) = 1;
                            end
                        end

                    end
                 end

                 for x = 1:4
                     if(Geracao(i,j) == Casa_linha2(1,x)) %tratar exceção linha 2
                         
                         for x = 1:4
                             if(Geracao(i,j+1) == Geracao(i,j) + Posicao_ex2(1,x))
                                 
                                 Pontuacao(i,j) = 1;
                             end
                         end

                     end
                 end

                  for x = 1:6
                     if(Geracao(i,j) == Casa_linha3(1,x)) %tratar exceção linha 3
                         
                         for x = 1:4
                             if(Geracao(i,j+1) == Geracao(i,j) + Posicao_ex7(1,x))
                                 
                                 Pontuacao(i,j) = 1;
                             end
                         end

                     end
                  end

                   for x = 1:4
                     if(Geracao(i,j) == Casa_linha4(1,x)) %tratar exceção linha 4
                         
                         for x = 1:4
                             if(Geracao(i,j+1) == Geracao(i,j) + Posicao_ex8(1,x))
                                 
                                 Pontuacao(i,j) = 1;
                             end
                         end

                     end
                   end
             end
         end
             
             %restante do tabuleiro
               for x = 1:8   
                    if(Geracao(i,j+1) == Geracao(i,j) + Posicao(1,x))

                        Pontuacao(i,j) = 1;
                        
                    end
               end
        end
    end
end

for i = 1:Individuos
    
    Avaliacao(i,1) = sum(Pontuacao(i,:));
end

Avaliacao2 = Avaliacao;
    
end

 