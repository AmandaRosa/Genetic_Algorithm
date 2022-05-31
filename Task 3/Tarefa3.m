%%Trabalho 3 - Algoritmos Genéticos
%Nome: Amanda Rosa Ferreira Jorge
%Matricula: 12112EBI001
%Professor: Keiji 

% surf(app.UIAxes, X,Y,Z) - gráfico de 3 eixos 

clc;
clear all;
close all;

Matriz_pais_X_selecionados = 0;
Matriz_novageracao_X = 0;
Matriz_pais_Y_selecionados = 0;
Matriz_novageracao_Y = 0;

Inicial_pop_X = randi([0 1], 5,10);
Inicial_pop_Y = randi([0 1], 5,10);

%% Interface
%imprimir melhores individuos x e y
%imprimir medias X e Y de cada geração
%alterar para elitismo ou torneio
%receber quantidade de individuos, quantidade de bits, quantidade de
%gerações, quantidade de torneios


%% Inicializar pop x e pop y

% Primeiro passo: transformar cada linha binária em um numero real
Geracao_bin_X = Inicial_pop_X;
Geracao_bin_Y = Inicial_pop_Y; 

%entrar com matriz binaria e receber uma matriz dec
Geracao_dec_X = bin_to_dec_X(Geracao_bin_X);
Geracao_dec_Y = bin_to_dec_Y(Geracao_bin_Y);


%% Avaliacao da população - cálculo de fitness

% calcular o fitness de cada par X e Y gerado 
Fitness_XY = calcula_fitness_XY(Geracao_dec_X, Geracao_dec_Y);

% calcular a média dos fitness dos indivíduos de cada geração por parzinho
% X e Y
Geracao_media_X = mean(Geracao_dec_X);
Geracao_media_Y = mean(Geracao_dec_Y);
Geracao_media = mean(Fitness_XY);

% Guardar a posicao do valor do PAR X e Y real que possuirem o maior valor para f(x)
[Index_XY, Maximo_novo] = coleta_maximo_XY(Fitness_XY);

% Selecionar o melhor PAR da Geracao
x = Geracao_dec_X(Index_XY,1);
y = Geracao_dec_Y(Index_XY,1);

% Selecionar o melhor fitness (Melhor valor do PAR X e Y para máxima f(x))
Maximo_valor = Maximo_novo;

%Melhor par da geração
disp( " X   Y    Fitness");
disp(x);
disp(y);
disp(Fitness_XY(Index_XY,1));

 %selecionar os pais da próxima geração - COLOCAR NA INTERFACE ESCOLHA
 %ENTRE TORNEIO OU ELITISMO
 
 %TORNEIO
% [Matriz_pais_X_selecionados, Matriz_pais_Y_selecionados] = torneio (Geracao_bin_X, Geracao_bin_Y, Fitness_XY);
%  
%  %ELITISMO
 [Matriz_pais_X_selecionados, Matriz_pais_Y_selecionados] = elitismo (Geracao_bin_X, Geracao_bin_Y, Fitness_XY);

%% Cross-Over -> After swapping all bits from a random position to the end ARRUMAAAAAAAAAR
[Matriz_saida_X] = crossover (Matriz_pais_X_selecionados);
[Matriz_saida_Y] = crossover (Matriz_pais_Y_selecionados);

 % Mutação
 [Matriz_novageracao_X] = mutacao(Matriz_saida_X);
 [Matriz_novageracao_Y] = mutacao(Matriz_saida_Y);
    
 %% Os filhos selecionados tornam-se pais da próxima geração
 Geracao_bin_X = Matriz_novageracao_X; 
 Geracao_bin_Y = Matriz_novageracao_Y; 
 
 
%% Dentro do Looping - gerar novas matrizes que viram pais e assim por diante

% o t varia da 2ª geracao até o numero de gerações desejada que neste caso
% é 80
for t = 2:80
    
    %%% Repete o Primeiro Processo de Avaliação dos Individuos
    
           %entrar com matriz binaria e receber uma matriz dec
           Geracao_dec_X = bin_to_dec_X(Geracao_bin_X);
           Geracao_dec_Y = bin_to_dec_Y(Geracao_bin_Y);
           
           % calcular o fitness de cada individuo 
           Fitness_XY = calcula_fitness_XY(Geracao_dec_X, Geracao_dec_Y);
           
           % calcular a média dos fitness dos indivíduos de cada geração
           Geracao_media_X = mean(Geracao_dec_X);
           Geracao_media_Y = mean(Geracao_dec_Y);
           Geracao_media = mean(Fitness_XY);
           

           % Guardar a posicao e o valor do x real que possui o minimo
           % valor para f(x)da geracao analisada
           [Index_XY, Maximo_novo] = coleta_maximo_XY(Fitness_XY);

          % Selecionar o melhor PAR da Geracao
          x = Geracao_dec_X(Index_XY,1);
          y = Geracao_dec_Y(Index_XY,1);

          % Selecionar o melhor fitness (Melhor valor do PAR X e Y para máxima f(x))
          Maximo_valor = Maximo_novo;

          %Melhor par da geração
          disp( " X   Y    Fitness");
          disp(x);
          disp(y);
          disp(Fitness_XY(Index_XY,1));

             %selecionar os pais da próxima geração - COLOCAR NA INTERFACE ESCOLHA
             %ENTRE TORNEIO OU ELITISMO

%              %TORNEIO
%                [Matriz_pais_X_selecionados, Matriz_pais_Y_selecionados] = torneio (Geracao_bin_X, Geracao_bin_Y, Fitness_XY);
% 
%              %ELITISMO
             [Matriz_pais_X_selecionados, Matriz_pais_Y_selecionados] = elitismo (Geracao_bin_X, Geracao_bin_Y, Fitness_XY);

            %% Cross-Over -> After swapping all bits from a random position to the end ARRUMAAAAAAAAAR
            [Matriz_saida_X] = crossover (Matriz_pais_X_selecionados);
            [Matriz_saida_Y] = crossover (Matriz_pais_Y_selecionados);

             % Mutação
             [Matriz_novageracao_X] = mutacao(Matriz_saida_X);
             [Matriz_novageracao_Y] = mutacao(Matriz_saida_Y);

             %% Os filhos selecionados tornam-se pais da próxima geração
             Geracao_bin_X = Matriz_novageracao_X; 
             Geracao_bin_Y = Matriz_novageracao_Y; 
    
                     

end

