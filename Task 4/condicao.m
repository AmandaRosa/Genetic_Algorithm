%Esta função tem objetivo de não deixar um intervalo com todas as máquinas
%funcionando

function [Geracao_turnos_inicial] = condicao(Geracao)

Geracao_turnos_inicial = Geracao;

for i = 1:4
    
    variable = find(Geracao(:,i)==0);
    posicao = randi ([1 7],1);
    
    if(isempty(variable))
        
        index_zero = find(Geracao(:,posicao)==0);
        Geracao_turnos_inicial(i,posicao) = 0;
        Geracao_turnos_inicial(index_zero,posicao) = 1;
        
    end
end

end