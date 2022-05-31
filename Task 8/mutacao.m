%%Esta função realiza a mutação 

function [Pais_mutacao] = mutacao(Geracao_pais_cross, Individuos)

Auxiliar = Geracao_pais_cross;

posicao = randi([1 13], 1);

x = [1,2,3,4,5,6,7,8,9,13];

% for loop = 1:50
    p = rand(1,1);

    if(p<=0.5)
        
        for i = 1:10
            if(posicao == x(1,i))
                
                val = rand(1,1);
                pai = randi([1 Individuos], 1);
                Auxiliar(pai,posicao) = val;
            elseif(posicao == 10 || posicao == 11 || posicao == 12)
                val = 100*rand(1,1);
                pai = randi([1 Individuos], 1);
                Auxiliar(pai,posicao) = val;
            end
        end
    end

Pais_mutacao = Auxiliar;

end
