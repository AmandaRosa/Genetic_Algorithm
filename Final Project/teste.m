%teste

% Matriz_potencias_bandpower = [ 0.0288    0.0366    0.0490    0.0057    0.0030    0.0179    0.0061    0.0053    0.0047];
Matriz_potencias_totais = [ 0.5750    0.7311    0.9808    0.1138    0.0602    0.3573    0.1219    0.1063    0.0947];
Matriz_potencias_medias = [0.0288    0.0366    0.0490    0.0057    0.0030    0.0179    0.0061    0.0053    0.0047];

Resultado = [ 0.0288    0.0366    0.0490    0.0057    0.0030    0.0179    0.0061    0.0053    0.0043 ];

Pot_media_ruidos = 0.1567;

clc;
close all;

Matriz_pot_totais = Matriz_potencias_totais;
Matriz_pot_medias = Matriz_potencias_medias;

%% cria pop - cada coluna é o coeficiente de uma faixa de ruído

Individuos = 100;
Elite = 25;
Grupo_Torneio = 5;
Geracoes = 20000;

for i = 1:Individuos
    
    pop_inicial = rand(1,9);
    
    Geracao_inicial(i,:) = pop_inicial./sum(pop_inicial);
    
end

%% Cálculo da Função Fitness

Fitness_coef = calcula_fitness( Individuos, Geracao_inicial, Matriz_pot_totais);

%% Avaliação Fitness

Resultado = avaliacao(Individuos, Geracao_inicial, Fitness_coef, Pot_media_ruidos, Matriz_pot_medias);

%% Elitismo e Torneio

Geracao_pais = elitismo( Individuos, Geracao_inicial, Elite, Grupo_Torneio, Resultado);

%% Melhor vetor coeficientes

 Vetor_coef = Geracao_pais(1,:);
 
%% Crossover

Geracao_pais_cross = crossover(Individuos, Geracao_pais);

%% Mutacao

Pais_mutacao = mutacao( Individuos, Geracao_pais_cross);

Geracao = Pais_mutacao;

%% LOOP

    for loop = 1:Geracoes

    % Cálculo da Função Fitness

    Fitness_coef = calcula_fitness( Individuos, Geracao, Matriz_pot_totais);

    % Avaliação Fitness

    Resultado = avaliacao(Individuos, Geracao, Fitness_coef, Pot_media_ruidos, Matriz_pot_medias);

    % Média da Geração

    %% aqui vetor media algo assim

    % Elitismo e Torneio

    Geracao_pais = elitismo( Individuos, Geracao, Elite, Grupo_Torneio, Resultado);

    % Melhor vetor coeficientes

     Vetor_coef = Geracao_pais(1,:);

    % Crossover

    Geracao_pais_cross = crossover(Individuos, Geracao_pais);

    % Mutacao

    Pais_mutacao = mutacao( Individuos, Geracao_pais_cross);

    Geracao = Pais_mutacao;


    end
    
    Vetor = sort(Resultado);
    Melhor_index = Vetor(1,1);
    Melhor_index2 = min(find(Melhor_index == Resultado));
    Melhor_vetor = Geracao(Melhor_index2,:);
    Vetor_coef  = Melhor_vetor;
    
    Conta = Vetor_coef.*Matriz_pot_totais;
    Total = sum(Conta);
    Conta_porcentagem = (Conta/Total)*100;
    
%    Vetor_coef = Vetor_coef/sum(Vetor_coef(1,:));
%     Vetor_coef = -1.*Vetor_coef(1,:);