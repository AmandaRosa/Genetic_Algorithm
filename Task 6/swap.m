%Esta função realiza a mutação SWAP entre os genes


function [Filhos_swap] = swap (Filhos_elitismo, Individuos)

for i = 1:10000
    Filhos_swap = Filhos_elitismo;
    
    %posicoes aleatorias para a mutação
    posicao_1 = randi([1 64], 1);
    posicao_2 = randi([1 64],1);
    
    individuo = randi([1 Individuos],1);
    
    Auxiliar = Filhos_elitismo(individuo,:);
    
    Elemento_troca = Auxiliar(1,posicao_1);
    Elemento_troca2 = Auxiliar(1,posicao_2);
    
    Auxiliar(1,posicao_1) = Elemento_troca2;
    Auxiliar(1,posicao_2) = Elemento_troca;
    
    Filhos_swap(individuo,:) = Auxiliar;
    
end

end