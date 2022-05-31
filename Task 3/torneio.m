%% Esta função realizar o TORNEIO na matriz Fitness para encontrar os melhores pares X e Y para geração futura

function [Matriz_pais_X_selecionados, Matriz_pais_Y_selecionados] = torneio (Geracao_bin_X, Geracao_bin_Y, Fitness_XY, Grupo_Torneio)

% for com a quantidade de loops = qde de torneios (50 torneios)
for i = 1:50
    %selecionados randi para o torneio o teste será uma disputa 3 a 3 em
    %uma matriz de 10 individuos
    r = randi([1 50],1,Grupo_Torneio); %arrumar para o usuário escolher quantos individuos disputaram o torneio

    %numero individuos selecionados para o torneio => neste caso: 3
    for j = 1:Grupo_Torneio

        Auxiliar(j,1) = Fitness_XY(r(1,j),1);

    end

    %agora verificar quem vence o torneio
    Maximo_torneio = max(Auxiliar);
    Index_XY = min(find(Fitness_XY == Maximo_torneio));

    %colocar este par XY selecionado no torneio na matriz de pais
    %selecionados

    Matriz_pais_X_selecionados(i,:) = Geracao_bin_X(Index_XY,:);
    Matriz_pais_Y_selecionados(i,:) = Geracao_bin_Y(Index_XY,:);

end

end