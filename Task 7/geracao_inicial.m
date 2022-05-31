%Esta função gera a nova geração da população do AG

function [Geracao_inicial] = geracao_inicial (Individuos, Bits)


for i = 1:Individuos
    for j = 1:Bits
        
        Geracao(i,j) = -5.12 + rand*(5.12-(-5.12));
    end
    
    Geracao_inicial(i,:) = Geracao(i,:);
end

end