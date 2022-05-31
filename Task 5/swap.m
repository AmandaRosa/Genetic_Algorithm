%Esta função realiza a mutação swap

function [Filhos_swap] = swap(Filhos_pmx, A, individuos)

for i = 1:5
    Filhos_swap = Filhos_pmx;
    
    %posicoes aleatorias para a mutação
    posicao_1 = randi([1 length(A)], 1);
    posicao_2 = randi([1 length(A)],1);
    
    individuo = randi([1 individuos],1);
    
    Auxiliar = Filhos_pmx(individuo,:);
    
    Elemento_troca = Auxiliar(1,posicao_1);
    Elemento_troca2 = Auxiliar(1,posicao_2);
    
    Auxiliar(1,posicao_1) = Elemento_troca2;
    Auxiliar(1,posicao_2) = Elemento_troca;
    
    Filhos_swap(individuo,:) = Auxiliar;
    
end

end