%% Esta função calcula a Probabilidade atribuída para cada individuo(string)

function [Probabilidade_individuo] = calcula_prob (Geracao_dec, Geracao_soma)

for i = 1:50
    Probabilidade_individuo(i,1) = ((Geracao_dec(i,1))/Geracao_soma);
end