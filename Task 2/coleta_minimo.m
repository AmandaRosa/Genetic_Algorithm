%% Esta fun��o coleta o melhor fitness (o minimo valor para a fun��o f(x))

function [Index, Minimo_novo] = coleta_minimo (Fitness)

   
        Minimo_novo = min(Fitness);
        Index = find(Fitness == Minimo_novo);
        
           
 end


