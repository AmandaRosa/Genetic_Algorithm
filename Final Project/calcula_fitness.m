%Calcula Fitness Function -  O QUE DE FATO ESTOU CALCULANDO AQUI? ARRUMAR

function [Fitness_coef] = calcula_fitness( Individuos ,Geracao_inicial, Matriz_potencias)

for i = 1:Individuos
    
    for j = 1:9
        
%         Fitness_coef(i,:) = Geracao_inicial(i,j) * 1+(-1.*Matriz_potencias(1,j));
       Fitness_coef(i,j) = Geracao_inicial(i,j) * Matriz_potencias(1,j);
        
    end
    

end