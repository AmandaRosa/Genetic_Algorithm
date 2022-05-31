%Esta função confere se a máquina para somente 1 vez durante os 4
%intervalos

function [Check_M] = paradas (Geracao_nova)

Check_M = Geracao_nova;

for j = 1:2
    
    %escrever para as máquinas 1 e 2 terem 2 intervalos seguidos
    y = min(find(Check_M(:,j)==0));
   if(y==1)
       Check_M(2,j) = 0;
       Check_M(3,j) = 1;
       Check_M(4,j) = 1;
       
   elseif(y==2)
       Check_M(1,j) = 1;
       Check_M(3,j) = 0;
       Check_M(4,j) = 1;
       
   elseif(y==3)
       Check_M(1,j) = 1;
       Check_M(2,j) = 1;
       Check_M(4,j) = 0;
   elseif(y==4)
       Check_M(1,j) = 1;
       Check_M(2,j) = 1;
       Check_M(3,j) = 0;
     
   elseif(isempty(y))
        %colocar um 0 em uma posicao aleatoria
        posicao = randi([1 3],1);
        Check_M(posicao,j) = 0;
        Check_M(posicao+1,j) = 0;
    end
end

for j = 3:7
    x = find(Check_M(:,j)==0);
    if(length(x)>1)
        for w = x(2):x(length(x))
            Check_M(w,j) = 1;
        end
    end
    if(isempty(x))
        %colocar um 0 em uma posicao aleatoria
        posicao = randi([1 4],1);
        Check_M(posicao,j) = 0;
    end
end

end