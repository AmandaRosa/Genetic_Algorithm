%% Algoritmos Genéticos - Tarefa 7
%Amanda Rosa Ferreira Jorge - 12112EBI001

clc;
close all;
clear all;

Parametros = 2;
Individuos = 20;
Bits = Parametros;
Elite = 5;
Grupo_torneio = 3;
Pc = 0.6;
Qde_mutacoes = 500;

%geração inicial variação do x entre -5.12 e 5.12 ARRUMAR
[X,Y] = meshgrid(-5.12:.1:5.12);

%plotando a função
Funcao = 20 + (X.*X- 10*cos(2*pi.*X)) +(Y.*Y - 10*cos(2*pi.*Y));

mesh(X,Y,Funcao)
hold on


%Geracao Inicial
Geracao_inicial = geracao_inicial (Individuos, Bits);

% disp(Geracao_inicial);

%calcula o fitness
Fitness = calcula_fitness (Geracao_inicial, Individuos, Bits);

Media = sum(Fitness)/Individuos;

%coletam os valores minimos
[Melhores_individuos, Melhores_encontrados, Melhores_Fitness] = coleta_minimo(Geracao_inicial,Fitness, Individuos,Bits, Elite, Grupo_torneio);

plot3(Melhores_encontrados(:,1),Melhores_encontrados(:,2),Melhores_Fitness,'s');
figure();
plot3(Melhores_encontrados(:,1),Melhores_encontrados(:,2),Melhores_Fitness,'o');
grid on
xlim([-5.12 5.12])
ylim([-5.12 5.12])
zlim([0 100])

%Cruzamento Radcliff
Pais_cruzamento = cruzamento_Radcliff(Melhores_individuos, Individuos, Bits, Pc);

%cruzamento Wright
Pais_cruzamento2 = cruzamento_Wright(Pais_cruzamento, Individuos, Bits, Pc);

%taxa de mutação pm
Pais_mutacao = mutacao(Pais_cruzamento2, Individuos, Bits, Qde_mutacoes);

%Nova Geração
Nova_geracao = Pais_mutacao;


%% looping de gerações

for loop = 2:100


            %calcula o fitness
            Fitness = calcula_fitness (Nova_geracao, Individuos, Bits);
            
            %Media da Geracao
            Media = sum(Fitness)/Individuos;

            %coletam os valores minimos
            [Melhores_individuos, Melhores_encontrados, Melhores_Fitness] = coleta_minimo(Geracao_inicial,Fitness, Individuos,Bits, Elite, Grupo_torneio);

            disp(Melhores_individuos);
            
            hold on
            scatter3(Melhores_encontrados(:,1),Melhores_encontrados(:,2),Melhores_Fitness,'r');
            plot3(Melhores_encontrados(:,1),Melhores_encontrados(:,2),Melhores_Fitness,'s');
            plot3(Melhores_encontrados(:,1),Melhores_encontrados(:,2),Melhores_Fitness,'o');
            grid on
            xlim([-5.12 5.12])
            ylim([-5.12 5.12])
            zlim([0 100])
            drawnow
            hold on

            %Cruzamento Radcliff
            Pais_cruzamento = cruzamento_Radcliff(Melhores_individuos, Individuos, Bits, Pc);

            %cruzamento Wright
            Pais_cruzamento2 = cruzamento_Wright(Pais_cruzamento, Individuos, Bits, Pc);

            %taxa de mutação pm
            Pais_mutacao = mutacao(Pais_cruzamento2, Individuos, Bits, Qde_mutacoes);

            %Nova Geração
            Nova_geracao = Pais_mutacao;

end

figure;
plot3(Melhores_encontrados(:,1),Melhores_encontrados(:,2),Melhores_Fitness,'*');
grid on
xlim([-5.12 5.12])
ylim([-5.12 5.12])
zlim([0 100])
            disp('MELHORES_ENCONTRADOS');
            disp(Melhores_encontrados);
            disp('MELHORES_Fitness');
            disp(Melhores_Fitness);
            
 Menor = min(Melhores_Fitness);
 Index = find(Menor == Melhores_Fitness);
 Menor_X = Melhores_encontrados(Index,1);
 Menor_Y = Melhores_encontrados(Index,2);
 disp(Menor);
 disp(Menor_X);   
 disp(Menor_Y);
