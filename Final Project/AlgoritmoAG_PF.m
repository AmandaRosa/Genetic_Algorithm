%% Algoritmo AG para o Projeto Final - Coeficientes Vetor Ruído
% Nome: Amanda Rosa F. Jorge Matricula: 12112EBI001

function [Vetor_coef] = AlgoritmoAG_PF( Matriz_potencias, Pot_ruidos)

clc;
close all;

Matriz_pot = Matriz_potencias;

%% cria pop - cada coluna é o coeficiente de uma faixa de ruído

Individuos = 10;
Elite = 2;
Grupo_Torneio = 3;
Geracoes = 5000;

for i = 1:Individuos
    
    pop_inicial = rand(1,9);
    
    Geracao_inicial(i,:) = pop_inicial./sum(pop_inicial);
    
end

%% Cálculo da Função Fitness

Fitness_coef = calcula_fitness( Individuos, Geracao_inicial, Matriz_pot);

%% Avaliação Fitness

Resultado = avaliacao(Individuos, Geracao_inicial, Fitness_coef, Pot_ruidos);

%% Elitismo e Torneio

Geracao_pais = elitismo( Individuos, Geracao_inicial, Elite, Grupo_Torneio, Resultado);

%% Melhor vetor coeficientes

 Vetor_coef = Geracao_pais(1,:);
 
%% Crossover

Geracao_pais_cross = crossover(Individuos, Geracao_pais);

%% Mutacao

Pais_mutacao = mutacao( Individuos, Geracao_pais_cross);

Geracao = Pais_mutacao;

% %% LOOP
% 
%     for loop = 1:Geracoes
% 
%     % Cálculo da Função Fitness
% 
%     Fitness_coef = calcula_fitness( Individuos, Geracao, Matriz_pot);
% 
%     % Avaliação Fitness
% 
%     Resultado = avaliacao(Individuos, Geracao, Fitness_coef, Pot_ruidos);
% 
%     % Média da Geração
% 
%     %% aqui vetor media algo assim
% 
%     % Elitismo e Torneio
% 
%     Geracao_pais = elitismo( Individuos, Geracao, Elite, Grupo_Torneio, Resultado);
% 
%     % Melhor vetor coeficientes
% 
%      Vetor_coef = Geracao_pais(1,:);
% 
%     % Crossover
% 
%     Geracao_pais_cross = crossover(Individuos, Geracao_pais);
% 
%     % Mutacao
% 
%     Pais_mutacao = mutacao( Individuos, Geracao_pais_cross);
% 
%     Geracao = Pais_mutacao;


%     end

end

