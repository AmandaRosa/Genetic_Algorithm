%%Esta função realiza o cruzamento PMX entre os pais selecionados

function [Filhos_pmx] = pmx (Pais, A, individuos)

Filhos_pmx = Pais;
Pontos = length(A);

Metade = individuos/2;

%posicoes aleatorias para o crossover
posicao_1 = randi([1 Metade],1);
posicao_2 = randi([Metade individuos],1);

%default de vectores filhos
filho_1 = zeros(1,length(Pais(1,:)));
filho_2 = zeros(1,length(Pais(1,:)));

%individuos aleatorios que serão os pais dos filhos gerados pelo crossover
pai_1 = randi([1 individuos], 1);
pai_2 = randi([1 individuos], 1);

%Auxiliares que vão receber os pais selecionados
Auxiliar1 = Pais(pai_1,:);
Auxiliar2 = Pais(pai_2,:);

%agora é colocar as partes do crossover nos filhos

for i  = posicao_1:posicao_2-1
    
    filho_1(1,i) = Auxiliar2(1,i);
    filho_2(1,i) = Auxiliar1(1,i);
    
end

%% agora completar o restante dos vetores filhos

%% PARA O FILHO 1
for i = 1:posicao_1
    
    Elemento = Auxiliar1(1,i);
    
    if(isempty(find(Elemento == filho_1)))
        filho_1(1,i) = Elemento;
    else
        Index = min(find(Elemento == filho_1));
        Elemento = Auxiliar1(1, Index);
        filho_1(1,i) = Elemento;
    end
end

for i = posicao_2:length(filho_1)
    
    Elemento = Auxiliar1(1,i);
    
    if(isempty(find(Elemento == filho_1)))
        filho_1(1,i) = Elemento;
    else
        Index = min(find(Elemento == filho_1));
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
        Index = min(find(Elemento == filho_2));
        Elemento = Auxiliar2(1, Index);
        filho_2(1,i) = Elemento;
    end
    
end

for i = posicao_2:length(filho_2)
    
    Elemento = Auxiliar2(1,i);
    
    if(isempty(find(Elemento == filho_2)))
        filho_2(1,i) = Elemento;
    else
        Index = min(find(Elemento == filho_2));
        Elemento = Auxiliar2(1, Index);
        filho_2(1,i) = Elemento;
    end
end

%verificar se algum ponto ficou sem alocação nos filhos
for j = 1:Pontos
    
    if(isempty(find(A(j) == filho_1)))
        Alocar = find(0 == filho_1);
        filho_1(1,Alocar) = A(j);
    else
    end
end

for j = 1:Pontos
    
    if(isempty(find(A(j) == filho_2)))
        Alocar = find(0 == filho_2);
        filho_2(1,Alocar) = A(j);
    else
    end
end

%nao repetir pontos
for Ponteiro = 1:Pontos
    Index = find(Ponteiro == filho_1);
    if(length(Index)>1)
        
        %descobrir qual numero está faltando
        for i = 1:Pontos
            
            if(isempty(find(A(i) == filho_1)))
                
                filho_1(1,min(Index)) = A(i);
            end
        end
    end
end

%nao repetir pontos
for Ponteiro = 1:Pontos
    Index = find(Ponteiro == filho_2);
    if(length(Index)>1)
        
        %descobrir qual numero está faltando
        for i = 1:Pontos
            
            if(isempty(find(A(i) == filho_2)))
                
                filho_2(1,min(Index)) = A(i);
                
            end
        end
        
    end
end

Filhos_pmx(pai_1,:) = filho_1;
Filhos_pmx(pai_2,:) = filho_2;


end