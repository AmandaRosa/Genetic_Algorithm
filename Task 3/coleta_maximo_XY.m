%% Esta fun��o coleta o melhor fitness (o minimo valor para a fun��o f(x))

function [Index_XY, Maximo_novo] = coleta_maximo_XY (Fitness_XY)
   
        Maximo_novo = max(Fitness_XY);
        Index_XY = min(find(Fitness_XY == Maximo_novo));
        
           
 end


