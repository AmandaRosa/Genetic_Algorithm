%%Esta função realiza a Mutação 

function [Pais_mutacao] = mutacao( Individuos, Geracao_pais_cross)

posicao = randi([1 8], 1);

Auxiliar = Geracao_pais_cross;

Qde_mutacoes = 50;

for loop = 1:Qde_mutacoes
    
        val = rand(1);

        pai = randi([1 Individuos], 1); 
        
        Auxiliar(pai,posicao) = val;
    
end

Pais_mutacao = Auxiliar;

end