%% Trabalho 8 - Algoritmos Genéticos por método de Penalidade para tratar Restrições
%Nome: Amanda Rosa Ferreira Jorge - 12112EBI001

for i = 9:30
clc;
close all;
% clear all;
%% Montagem da população inicial
Individuos = 30;
Elite = 5;
Pontos = 100;
Grupo_torneio=3;
Geracoes = 2000;

Geracao_inicial = geracao_inicial(Individuos);
disp(Geracao_inicial);
%% Cálculo Fitness e Penalidades

[Geracao, Penalidades] = calculo_fitness(Geracao_inicial, Individuos);

disp(Penalidades);

% Media Geracao
Media_fitness(1,1) = sum(Penalidades)/Individuos;
Ordenar_fitness = sort(Penalidades);
Melhor_fitness(1,1) = Ordenar_fitness(1,1);

disp(Melhor_fitness);
%% Elitismo

[Geracao_pais] = elitismo2(Geracao, Penalidades, Individuos, Elite, Grupo_torneio);

disp(Geracao_pais);

%% Crossover

[Geracao_pais_cross] = crossover(Geracao_pais, Individuos);

disp(Geracao_pais_cross);

%% Mutação

[Pais_mutacao] = mutacao(Geracao_pais_cross, Individuos);

disp(Pais_mutacao);

%% Nova Geração

Nova_Geracao = Pais_mutacao;
disp(Nova_Geracao);


for loop = 2:Geracoes
    
      [Geracao, Penalidades] = calculo_fitness(Nova_Geracao, Individuos);
                
                disp(Penalidades);
                
                % Media Geracao
                Media_fitness(1,loop) = sum(Penalidades)/Individuos;
                Ordenar_fitness = sort(Penalidades);
                Melhor_fitness(1,loop) = Ordenar_fitness(1,1);
                
                disp(Melhor_fitness);
                
                %% Elitismo
                
                [Geracao_pais] = elitismo2(Nova_Geracao, Penalidades, Individuos, Elite, Grupo_torneio);
                
                disp(Geracao_pais);
                
                %% Crossover
                
                [Geracao_pais_cross] = crossover(Geracao_pais, Individuos);
                
                disp(Geracao_pais_cross);
                
                %% Mutação
                
                [Pais_mutacao] = mutacao(Geracao_pais_cross, Individuos);
                
                disp(Pais_mutacao);
                
                %% Nova Geração
                
                Nova_Geracao = Pais_mutacao;
                disp(Nova_Geracao);
                
end

Fitness = sort(Penalidades);
Fitness_final(i,1) = Fitness(1,1);
disp(Fitness);
Melhor_index = find(Fitness == Penalidades);
Melhor_sequencia(:,:) = Nova_Geracao(min(Melhor_index),:);
disp(Melhor_sequencia);
app.FitnessEditField.Value = Fitness;
Xs(i,:) = Melhor_sequencia;

end
