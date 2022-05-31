%% Tarefa 2 - Algoritmos Gen�ticos
% Nome: Amanda Rosa Ferreira Jorge
% Matricula: 12112EBI001

clc;
clear all;
close all;

%% inicia popula��o
Inicial_pop = randi([0 1], 50,10);
Tabela = 0;
Matriz_pais_selecionados = 0;
Matriz_geracao = 0;
%% avaliacao da popula��o - c�lculo de fitness

% Primeiro passo: transformar cada linha bin�ria em um numero real
Geracao_bin = Inicial_pop; 

%entrar com matriz binaria e receber uma matriz dec
Geracao_dec = bin_to_dec(Geracao_bin);

% calcular o fitness de cada individuo 
Fitness = calcula_fitness(Geracao_dec);

% calcular a m�dia dos fitness dos indiv�duos de cada gera��o
Geracao_media = mean(Fitness);

% Guardar a posicao e o valor do x real que possui o minimo valor para f(x)
[Index, Minimo_novo] = coleta_minimo(Fitness); 

% Selecionar o melhor individuo da Geracao
Minimo_x = Geracao_dec(Index,1);

% Selecionar o melhor fitness (menor valor para f(x))
Minimo_valor = Minimo_novo;

 %Agrupar os valores em uma tabela
 Tabela(1,1) = Minimo_x;
 Tabela(1,2) = Minimo_valor;
 Tabela(1,3) = Geracao_media;
           
%Imprimir o valor de x com melhor fitness da sua geracao
disp( " X  Fitness  M�dia ");
disp(Tabela); 

%escolher 25 reprodutores aleatoriamente da matriz (25 individuos)
%escolher individuos que tiveram os melhores valores fitness
 Matriz_pais_selecionados = seleciona_pais(Geracao_bin, Fitness);
    
% Cross-Over -> After swapping all bits from a random position to the end
 [Matriz_saida] = crossover (Matriz_pais_selecionados);

% Muta��o
[Matriz_novageracao] = mutacao(Matriz_saida);
    
% e recome�a o processo -> filhos viram pais e entra no loop seguinte
Geracao_bin = Matriz_novageracao;



%% Dentro do Looping - gerar novas matrizes que viram pais e assim por diante

for t = 2:80
    
    %%% Repete o Primeiro Processo de Avalia��o dos Individuos
    
           %entrar com matriz binaria e receber uma matriz dec
           Geracao_dec = bin_to_dec(Geracao_bin);

           % calcular o fitness de cada individuo 
           Fitness = calcula_fitness(Geracao_dec);
           
           % calcular a m�dia dos fitness dos indiv�duos de cada gera��o
           Geracao_media = mean(Fitness);

           % Guardar a posicao e o valor do x real que possui o minimo
           % valor para f(x)da geracao analisada
           [Index, Minimo_novo] = coleta_minimo(Fitness); 

           % Selecionar o melhor individuo da Geracao 
           Minimo_x  = min(Geracao_dec(Index,1));

           % Selecionar o melhor fitness (menor valor para f(x))
           Minimo_valor = min(Minimo_novo);
           
           %Agrupar os valores em uma tabela
           Tabela(t,1) = Minimo_x;
           Tabela(t,2) = Minimo_valor;
           Tabela(t,3) = Geracao_media;
           
           %Imprimir o valor de x com melhor fitness da sua geracao
           disp( " X   Fitness    M�dia");
           disp(Tabela);
           
           %escolher 25 reprodutores aleatoriamente da matriz (25 individuos)
           %escolher individuos que tiveram os melhores valores fitness
           Matriz_pais_selecionados = seleciona_pais(Geracao_bin, Fitness);
    
           % Cross-Over -> After swapping all bits from a random position to the end
           [Matriz_saida] = crossover (Matriz_pais_selecionados);

           % Muta��o
           [Matriz_novageracao] = mutacao(Matriz_saida);
    
           % e recome�a o processo -> filhos viram pais e entra no loop seguinte
            Geracao_bin = Matriz_novageracao;            

end

figure();
for t = 1:80
    plot(t,Tabela(t,1), '-s');
    legend('Valor de X');
    title('Gr�fico Algoritmo Gen�tico Melhor indiv�duo x gera��es');
    xlabel('Gera��o');
    ylabel('Valor de X');
    hold on
end   

