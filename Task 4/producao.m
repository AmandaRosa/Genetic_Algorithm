%Esta funcao calcula a producao liquida de cada intervalo

function  [Producao] = producao (Geracao_turnos)


    Capacidade = [20;15;35;40;15;15;10];
    
    Cap1 = Geracao_turnos(1,:)*Capacidade;
    Cap2 = Geracao_turnos(2,:)*Capacidade;
    Cap3 = Geracao_turnos(3,:)*Capacidade;
    Cap4 = Geracao_turnos(4,:)*Capacidade;

    Producao(1,:) = (150 - (150-Cap1) - 80);
    Producao(2,:) = (150 - (150-Cap2) - 90);
    Producao(3,:) = (150 - (150-Cap3) - 65);
    Producao(4,:) = (150 - (150-Cap4) - 70);
    
end