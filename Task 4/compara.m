%Esta funcao compara os turnos gerados e qual deles possui a melhor
%capacidade de produção

function [Melhores_turnos, Melhor_producao] = compara (Producao_inicial, Producao_nova, Geracao_1, Geracao_2)

Producao_liquida1 = sum(Producao_inicial);
Producao_liquida2 = sum(Producao_nova);

if(Producao_liquida1>Producao_liquida2)
    Melhor_producao = Producao_inicial;
    Melhores_turnos = Geracao_1;
else
    Melhor_producao = Producao_nova;
    Melhores_turnos = Geracao_2; 
end