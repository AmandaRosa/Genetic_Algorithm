%% Algoritmo AG para o Projeto Final - Coeficientes Vetor Ru�do
% Nome: Amanda Rosa F. Jorge Matricula: 12112EBI001

function [Vetor_coef] = AlgoritmoAG_PF( Matriz_potencias, Pot_ruidos)

clc;
close all;

Matriz_pot = Matriz_potencias;

%% cria pop - cada coluna � o coeficiente de uma faixa de ru�do

Individuos = 10;
Elite = 2;
Grupo_Torneio = 3;
Geracoes = 5000;

for i = 1:Individuos
    
    pop_inicial = rand(1,9);
    
    Geracao_inicial(i,:) = pop_inicial./sum(pop_inicial);
    
end

%% C�lculo da Fun��o Fitness

Fitness_coef = calcula_fitness( Individuos, Geracao_inicial, Matriz_pot);

%% Avalia��o Fitness

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
%     % C�lculo da Fun��o Fitness
% 
%     Fitness_coef = calcula_fitness( Individuos, Geracao, Matriz_pot);
% 
%     % Avalia��o Fitness
% 
%     Resultado = avaliacao(Individuos, Geracao, Fitness_coef, Pot_ruidos);
% 
%     % M�dia da Gera��o
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

