%% Esta função visa calcular o fitness e aplicar as penalidades necessárias caso as restrições não sejam cumpridas

function [Geracao, Penalidades] = calculo_fitness(Geracao_inicial, Individuos)


%% função
fitness_liquido = 0;
%realizar estes procedimentos para cada linhas colocar um for aqui depois
for linha = 1:Individuos
    
    Somatorio1 = 0;
    Somatorio2 = 0;
    Somatorio3 = 0;

            for i = 1:4 %somatorio 1
                
                Somatorio1 = Geracao_inicial(linha,i) + Somatorio1;
                Somatorio1 = 5*Somatorio1;
                
            end

            for i = 1:4 %somatorio 2
                
                Somatorio2 = Geracao_inicial(linha,i)*Geracao_inicial(linha,i) + Somatorio2;
                Somatorio2 = -5*Somatorio2;
                
            end

            for i = 5:13 %somatorio 3

                Somatorio3 = Geracao_inicial(linha,i)*Geracao_inicial(linha,i) + Somatorio3;
                Somatorio3 = -1*Somatorio3;
                
            end

            %agrupamento dos valores dos somatorios 1, 2 e 3
            fitness_liquido(linha,1) = Somatorio1+Somatorio2+Somatorio3;

%% restrições a serem seguidas/ caso a condição seja descumprida é somado 1000 pontos

%g1

g1 = 2*Geracao_inicial(linha,1) + 2*Geracao_inicial(linha,2) + Geracao_inicial(linha,10) + Geracao_inicial(linha,11) - 10;

%g2
g2 = 2*Geracao_inicial(linha,1) + 2*Geracao_inicial(linha,3) + Geracao_inicial(linha,10) + Geracao_inicial(linha,12) - 10;

%g3
g3 = 2*Geracao_inicial(linha,2) + 2*Geracao_inicial(linha,3) + Geracao_inicial(linha,11) + Geracao_inicial(linha,12) - 10;

%g4
g4 = -8*Geracao_inicial(linha,1) + Geracao_inicial(linha,10);

%g5
g5 = -8*Geracao_inicial(linha,2) + Geracao_inicial(linha,11);

%g6
g6 = -8*Geracao_inicial(linha,3) + Geracao_inicial(linha,12);

%g7
g7 = -2*Geracao_inicial(linha,4) - Geracao_inicial(linha,5) + Geracao_inicial(linha,10);

%g8
g8 = -2*Geracao_inicial(linha,6) - Geracao_inicial(linha,7) + Geracao_inicial(linha,11);

%g9
g9 = -2*Geracao_inicial(linha,8) - Geracao_inicial(linha,9) + Geracao_inicial(linha,12);

if(g1>0)
    g1 = g1*1000;
    fitness_liquido(linha,1) =  fitness_liquido(linha,1)+g1; 
end
if(g2>0)
    g2 = g2*1000;
    fitness_liquido(linha,1) =  fitness_liquido(linha,1) + g2; 
end
if(g3>0)
    g3 = g3*1000;
    fitness_liquido(linha,1) =  fitness_liquido(linha,1) + g3; 
end
if(g4>0)
    g4 = g4*1000;
    fitness_liquido(linha,1) =  fitness_liquido(linha,1) + g4; 
end
if(g5>0)
    g5 = g5*1000;
    fitness_liquido(linha,1) =  fitness_liquido(linha,1) + g5; 
end
if(g6>0)
    g6 = g6*1000;
    fitness_liquido(linha,1) =  fitness_liquido(linha,1) + g6; 
end
if(g7>0)
    g7 = g7*1000;
    fitness_liquido(linha,1) =  fitness_liquido(linha,1) + g7; 
end
if(g8>0)
    g8 = g8*1000;
    fitness_liquido(linha,1) =  fitness_liquido(linha,1) + g8; 
end
if(g9>0)
    g9 = g9*1000;
    fitness_liquido(linha,1) =  fitness_liquido(linha,1) + g9; 
end

end

Penalidades = fitness_liquido(:,:);
Geracao = Geracao_inicial;

end