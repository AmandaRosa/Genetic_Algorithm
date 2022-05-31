%% Este trabalho visa resolver o problema do Cavalo do Xadrez
% Nome: Amanda Rosa Ferreira Jorge
% Matricula: 12112EBI001

%tabela casa e coordenadas de cada posição do tabuleiro
clc;
clear all;

Casa = catalogo();
Individuos = 40;

% criar um cromossomo de 64 posições - semelhante ao problema das cidades

A = Casa(:,1);
A = A.';

%vetor aleatorio de posições iniciais
% B(1,:) = randperm(length(A));

for i = 1:Individuos
    
    B(1,:) = randperm(length(A));
    Pop_inicial(i,:) = B(:,:);

end

% disp(Pop_inicial);

%fazer um for para o tanto de individuos necessários para os calculos
Avaliacao = avaliacao(Pop_inicial, Individuos);

% disp(Avaliacao);

%avaliação - avaliar os individuos com as posicções aleatorias
%aqueles individuos que tiverem posições subsequentes corretas colocar 1
%para correto, fazer a multipicacao e somar os individuos que tiverem
%maiores somas passarão adiante -> visando o melhor individuo com melhor
%percurso

Filhos_elitismo = elitismo(Pop_inicial, Individuos, Avaliacao);

% disp(Filhos_elitismo);

% agora realizar o crossover PMX
Filhos_pmx = pmx(Filhos_elitismo, A, Individuos);

% disp(Filhos_pmx);

%realizar a mutação SWAP
Filhos_swap = swap(Filhos_elitismo, Individuos);

% disp(Filhos_swap);

%Nova Geracao
Pop_inicial2 = Filhos_swap;

Media(1,1) = (sum(Avaliacao)/Individuos);
 
for loop = 1:10000 %alterar para 10000 gerações

    Avaliacao2 = avaliacao(Pop_inicial2, Individuos);

%     disp(Avaliacao2);
    
    Filhos_elitismo = elitismo(Pop_inicial2, Individuos, Avaliacao2);
    
%     disp(Filhos_elitismo);
    
    %agora realizar o crossover PMX
    Filhos_pmx = pmx(Filhos_elitismo, A ,Individuos);
    
    %realizar a mutação SWAP
    Filhos_swap = swap(Filhos_pmx, Individuos);
    
%     disp(Filhos_swap);
    
    %Nova Geracao
    Pop_inicial2 = Filhos_swap;
    
    %Media dos fitness
    Media(loop,1) = (sum(Avaliacao2)/Individuos);

end

Melhor_pontuacao = max(Avaliacao2);

Melhor_individuo = min(find(Melhor_pontuacao == Avaliacao2));

Melhor_trajetoria = Pop_inicial2(Melhor_individuo, :);

disp(Melhor_pontuacao);
disp(Melhor_trajetoria);

%plotar trajetória 
%pegar melhor trajetoria, no catalogo pegar coordenadas x e y

for i = 1:64
    
    Posicao_X(1,i) = Casa(Melhor_trajetoria(1,i),2);
    Posicao_Y(1,i) = Casa(Melhor_trajetoria(1,i),3);
    
end

disp(Posicao_X);