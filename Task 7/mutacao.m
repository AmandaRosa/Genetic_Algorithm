%%Esta função realiza a mutação 

function [Pais_mutacao] = mutacao(Pais_cruzamento2, Individuos, N, QDE_mutacoes)

posicao = randi([1 N], 1);

Auxiliar = Pais_cruzamento2;


for loop = 1:QDE_mutacoes
    
        val = -5.12 + rand*(5.12-(-5.12));

        pai = randi([1 Individuos], 1); 
        
        Auxiliar(pai,posicao) = val;
    
end

Pais_mutacao = Auxiliar;

end