%% Trabalho 5 - Algoritmos Genéticos
% Nome: Amanda Rosa Ferreira Jorge | Matrícula: 12112EBI001


% criar populacao inicial => 5 indivíduos aleatórios com 6 cidades DEPOIS
% ARRUMAR EM UMA FUNÇÃO, NAO CONSEGUI
for i = 1:6
   A(i) = i;
end

for i = 1:length(A)
    B(i,:) = randperm(length(A));
end

individuos = 6;

%cria matriz pop inicial
Geracao_inicial = B;

disp(Geracao_inicial);

% pegar posições de cada uma das cidades

% matriz armazena as posições X das cidades
Posicoes_X = [ 1 2 3 4 5 6]
% 
% % matriz armazena as posições Y das cidades
Posicoes_Y = [ 1 2 3 4 5 6]
% 
% % cálculo dos fitness dos indivíduos
Distancias = trajetoria(Geracao_inicial, Posicoes_X, Posicoes_Y, A, individuos);
disp(Distancias);

%melhor_trajetoria
Menor_trajetoria = min(Distancias);
Melhor_trajetoria = find(Menor_trajetoria == Distancias);
Selecionado = Geracao_inicial(Melhor_trajetoria,:);
disp(Selecionado);

% % utilizar elitismo para seleção dos pais
Pais = elitismo_pcv(Distancias, Geracao_inicial,individuos);
disp(Pais);

% % cruzamento PMX
Filhos_pmx = pmx (Pais, A, individuos);
disp(Filhos_pmx);

% % swap mutation 
Filhos_swap = swap(Filhos_pmx, A, individuos);
disp(Filhos_swap);

disp(' -------------------------------------------');

%recomeça
Geracao_inicial = Filhos_swap;

for loop = 1:100

% % cálculo dos fitness dos indivíduos
Distancias = trajetoria(Geracao_inicial, Posicoes_X, Posicoes_Y, A, individuos);
disp(Distancias);

%melhor_trajetoria
Menor_trajetoria = min(Distancias);
Melhor_trajetoria = find(Menor_trajetoria == Distancias);
Selecionado = Geracao_inicial(Melhor_trajetoria,:);
disp(Selecionado);

% % utilizar elitismo para seleção dos pais
Pais = elitismo_pcv(Distancias, Geracao_inicial,individuos);
disp(Pais);

% % cruzamento PMX
Filhos_pmx = pmx (Pais, A, individuos);
disp(Filhos_pmx);

% % swap mutation 
Filhos_swap = swap(Filhos_pmx, A, individuos);
disp(Filhos_swap);

%recomeça
Geracao_inicial = Filhos_swap;

end

Trajeto = Selecionado(1,:);
            
%             %ligar os pontos
for i = 1:length(A)
    Matrix_pontos(i,1) = (Posicoes_X(1,Trajeto(1,i)));
    Matrix_pontos(i,2) = (Posicoes_Y(1,Trajeto(1,i)));
end

disp(Matrix_pontos);
