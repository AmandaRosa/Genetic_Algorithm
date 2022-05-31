%% Esta função calcula a probabilidade cumulativa obtida para cada individuo
%adicionando o fitness dos membros anteriores

function [Probabilidade_cumulativa] = calcula_cum(Probabilidade_individuo)


for i = 1:50
 
        Probabilidade_cumulativa(i,1) = Probabilidade_individuo(i,1);
    
    j=i;
    
    while(j>1)
         
       j=j-1;
       Auxiliar  = Probabilidade_individuo(j,1);
       Probabilidade_cumulativa(i,1) = Probabilidade_cumulativa(i,1) + Auxiliar;
       
    end
      
end

end