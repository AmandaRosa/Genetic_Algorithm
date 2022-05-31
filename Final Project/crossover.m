%% Esta fun��o visa realizar o crossover entre a Geracao dos Pais

function [Geracao_pais_cross] = crossover(Individuos, Geracao_pais)

Bits = 9;
Geracao_pais_cross = Geracao_pais;

%   for i = 1:50
    
%utilizar porcentagem de Pc = 0.6, se p>=Pc o crossover ocorre
    p = rand(1,1);

        if(p<=0.6)
            %posi��o cross over aleatoria
            posicao = randi([1 Bits], 1);
    
            %selecao dos pais para crossover aleatoria
            pai_1 = randi([1 Individuos], 1);
            pai_2 = randi([1 Individuos], 1);
 
            %crossover
            Auxiliar1 = Geracao_pais(pai_1,:);
            Auxiliar2 = Geracao_pais(pai_2,:);

            Auxiliar3(1,posicao:Bits) = Auxiliar1(1,posicao:Bits);
            Auxiliar1(1,posicao:Bits) = Auxiliar2(1,posicao:Bits);
            Auxiliar2(1,posicao:Bits) = Auxiliar3(1,posicao:Bits);

            %retornar o crossover para a matriz de saida
            Geracao_pais_cross(pai_1,:) = Auxiliar1;
            Geracao_pais_cross(pai_2,:) = Auxiliar2;
        end  
%     end 

end