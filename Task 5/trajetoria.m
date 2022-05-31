%%Esta função calcula a distância das diferentes trajetórias da matriz -


function [Fitness] = trajetoria(Geracao, X, Y, A, individuos)

Max = length(A);

for ind = 1:individuos
    
    Aux = Geracao(ind,:);
    
    for i = 1:Max
        
        if(i<Max)
            
            ponto = i;
            ponto2 = i+1;
            
            Auxiliar = sqrt( (X(1,Aux(1,ponto2))- X(1,Aux(1,ponto)))^2 + (Y(1,ponto2)- Y(1,ponto))^2);
            
            Distancia(ind,i) = Auxiliar;
            
            
        elseif(i == Max)
            
            Distancia(ind,i) =  sqrt ((X(1,Aux(1,Max))- X(1,Aux(1,1)) )^2 + (Y(1,Aux(1,Max))- Y(1,Aux(1,1))) ^2);
            
        end
        
        Fitness(ind,1) = sum(Distancia(ind,:));
    end
end

end

