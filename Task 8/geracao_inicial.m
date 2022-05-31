%% Esta função visa gerar uma ppulação sobre as condições pré-estabelecidas

function [Geracao_inicial] = geracao_inicial(Individuos)


% para xi onde i = 1,2,....,9,13  0<=xi<=1
for linha = 1:Individuos
    for i = 1:9

        Auxiliar(linha,i) = rand(1,1);

    end
end
%para xi onde i = 10,11,12 0<=xi<=100

for linha = 1:Individuos
    for i = 10:12

        Auxiliar(linha,i) = 100*rand(1,1);

    end
end
%para xi onde i=13
i = 13;
for linha = 1:Individuos
    
    Auxiliar(linha,i) = rand(1,1);
end

  Geracao_inicial = Auxiliar(:,:);
  
end
