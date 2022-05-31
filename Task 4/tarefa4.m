%% Trabalho 04 - Algoritmos Genéticos
% Nome: Amanda Rosa Ferreira Jorge  - Matrícula: 12112EBI001
% Professor: Keiji Yamamoto

clc;
clear all;
close all;

Melhores_turnos = 0;
Melhor_producao = 0;

Geracao_inicial = randi([0 1], 4,7);

Geracao_turnos_inicial = paradas(Geracao_inicial);

Producao_inicial = producao(Geracao_turnos_inicial);

[Producao_nova1, Geracao_nova1] = condicao2 (Producao_inicial, Geracao_turnos_inicial);

%% Segunda scheduling para comparacao

Geracao_inicial2 = randi([0 1], 4,7);

Geracao_turnos_inicial2 = paradas(Geracao_inicial2);

Producao_inicial2 = producao(Geracao_turnos_inicial2);

[Producao_nova2, Geracao_nova2] = condicao2 (Producao_inicial2, Geracao_turnos_inicial2);

%% Verificar qual scheduling ganha

[Melhores_turnos, Melhor_producao] = compara(Producao_nova1, Producao_nova2, Geracao_nova1, Geracao_nova2);

Geracao_nova1 = Melhores_turnos;
Producao_nova1 = Melhor_producao;

Prod_liq(1,:) = producao_liq_intervalos(Melhor_producao);
Media_individuos(1,:) = media_ind(Melhores_turnos);

%% REALIZAR O LOOPING

for i = 2:100
    
    Geracao_inicial2 = randi([0 1], 4,7);
    
    Geracao_turnos_inicial2 = paradas(Geracao_inicial2);
    
    Producao_inicial2 = producao(Geracao_turnos_inicial2);
    
    [Producao_nova2, Geracao_nova2] = condicao2 (Producao_inicial2, Geracao_turnos_inicial2);
    
    %% Verificar qual scheduling ganha
    
    [Melhores_turnos, Melhor_producao] = compara(Producao_nova1, Producao_nova2, Geracao_nova1, Geracao_nova2);
    
    Geracao_nova1 = Melhores_turnos;
    Producao_nova1 = Melhor_producao;
    
    disp(Melhores_turnos);
    disp(Melhor_producao);
    
    Prod_liq(i,:) = producao_liq_intervalos(Melhor_producao);
    Media_individuos(i,:) = media_ind(Melhores_turnos);
    
end

[Melhor_producao_FIM, Melhores_turnos_FIM] = condicao2(Melhor_producao, Melhores_turnos);

Intervalo_1 = Media_individuos(:,1);
Intervalo_2 = Media_individuos(:,2);
Intervalo_3 = Media_individuos(:,3);
Intervalo_4 = Media_individuos(:,4);

Prod_liq_1 = Prod_liq(:,1);
Prod_liq_2 = Prod_liq(:,2);
Prod_liq_3 = Prod_liq(:,3);
Prod_liq_4 = Prod_liq(:,4);

fprintf('    M1    M2    M3    M4    M5    M6    M7\n')
disp(Melhores_turnos_FIM);
disp(Melhor_producao_FIM);
disp(Media_individuos);
disp(Prod_liq);



