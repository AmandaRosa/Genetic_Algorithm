%TESTE PMX

function [] = pmx_teste (pai_1, pai_2)

%posicoes aleatorias para o crossover
posicao_1 = randi([2 3], 1);
posicao_2 = randi([4 5],1);

%default de vectores filhos
filho_1 = zeros(1,6);
filho_2 = zeros(1,6);

%Auxiliares que vão receber os pais selecionados
Auxiliar1 = pai_1;
Auxiliar2 = pai_2;

%agora é colocar as partes do crossover nos filhos

for i  = posicao_1:posicao_2
    
    filho_1(1,i) = Auxiliar2(1,i);
    filho_2(1,i) = Auxiliar1(1,i);
    
end

%% PARA O FILHO 1
for i = 1:posicao_1
    
    Elemento = Auxiliar1(1,i);
    
    if(isempty(find(Elemento == filho_1)))
        filho_1(1,i) = Elemento;
    else
        Index = find(Elemento == filho_1);
        Elemento = Auxiliar1(1, Index);
        filho_1(1,i) = Elemento;
    end

end

for i = posicao_2:length(filho_1)
    
    Elemento = Auxiliar1(1,i);
    
    if(isempty(find(Elemento == filho_1)))
        filho_1(1,i) = Elemento;
    else
        Index = find(Elemento == filho_1);
        Elemento = Auxiliar1(1, Index);
        filho_1(1,i) = Elemento;
    end
end

%% PARA O FILHO 2

for i = 1:posicao_1
    
    Elemento = Auxiliar2(1,i);
    
    if(isempty(find(Elemento == filho_2)))
        filho_2(1,i) = Elemento;
    else
        Index = find(Elemento == filho_2);
        Elemento = Auxiliar2(1, Index);
        filho_2(1,i) = Elemento;
    end

end

for i = posicao_2:length(filho_2)
    
    Elemento = Auxiliar2(1,i);
    
    if(isempty(find(Elemento == filho_2)))
        filho_2(1,i) = Elemento;
    else
        Index = find(Elemento == filho_2);
        Elemento = Auxiliar2(1, Index);
        filho_2(1,i) = Elemento;
    end
end

disp('filho_1');
disp(filho_1);
disp('filho_2');
disp(filho_2);
    
end