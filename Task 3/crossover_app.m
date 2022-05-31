%% Esta função realiza o cross-over entre os individuos da matriz

function [Matriz_saida] = crossover_app (Matriz_entrada, Bits)

Matriz_saida = Matriz_entrada;
%seleciona duas strings aleatorias da matriz e realiza o crossover em uma
   
  for i = 1:50
    
%utilizar porcentagem de Pc = 0.6, se p>=Pc o crossover ocorre
    p = rand(1,1);

        if(p<=0.6)
            %posição cross over aleatoria
            posicao = randi([1 Bits], 1);
    
            %selecao dos pais para crossover aleatoria
            pai_1 = randi([1 50], 1);
            pai_2 = randi([1 50], 1);
 
            %crossover
            Auxiliar1 = Matriz_entrada(pai_1,:);
            Auxiliar2 = Matriz_entrada(pai_2,:);

            Auxiliar3(1,posicao:Bits) = Auxiliar1(1,posicao:Bits);
            Auxiliar1(1,posicao:Bits) = Auxiliar2(1,posicao:Bits);
            Auxiliar2(1,posicao:Bits) = Auxiliar3(1,posicao:Bits);

            %retornar o crossover para a matriz de saida
            Matriz_saida(pai_1,:) = Auxiliar1;
            Matriz_saida(pai_2,:) = Auxiliar2;
        end  
    end  
end   
