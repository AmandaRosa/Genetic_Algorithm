%% Esta função realiza o ELITISMO na matriz Fitness para selecao dos melhores pares X e Y

function [Pais] = elitismo_pcv (Distancias, Geracao_inicial, individuos)

elite = individuos/2;
Auxiliar = sort(Distancias);


%Este loop guardar as posições dos 3 menores valores
for i = 1:elite
    Posicao = min(find(Auxiliar(i) == Distancias));
    Pais(i,:) = Geracao_inicial(Posicao,:);
end



resto = individuos - elite;
aleatorio = randi([1 individuos],1,resto);
for x = 1:resto
    
    Pais(x+elite,:) = Geracao_inicial(aleatorio(1,x),:);
    
end

end