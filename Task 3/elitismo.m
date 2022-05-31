%% Esta função realiza o ELITISMO na matriz Fitness para selecao dos melhores pares X e Y 

function [Matriz_pais_X_selecionados, Matriz_pais_Y_selecionados] = elitismo (Geracao_bin_X, Geracao_bin_Y, Fitness_XY, Elite)

%seleciona 25 aleatórios individuos a partir de r
r = randi([1 50],1,Elite); %ex: r1 = [ 3     1     3     1     1]

    for i = 1:Elite

        posicao = r(1,i);
        Matriz_pais_X_selecionados(i,:) = Geracao_bin_X(posicao,:);
        Matriz_pais_Y_selecionados(i,:) = Geracao_bin_Y(posicao,:);

    end

%seleciona os 25 melhores a partir do Fitness e salvar 25 posições,
%recolher essas strings em Geracao_bin_X e Geracao_bin_Y

%Lógica = Copia a matriz Fitness, aplica o sort (ordena em ordem
%descrecente). Na matriz fitness original, procurar a posicao dos valores
%encontrados -> pronto, pais selecionados

    Auxiliar = sort(Fitness_XY, 'descend');
    
    Resto = 50-(Elite);
    %Este loop guardar as posições dos 25 menores valores
    for i = 1:Resto
        Melhores_index_XY(i,1) = min(find(Auxiliar(i,1) == Fitness_XY));
    end  
    
    %Este loop seleciona os 25 melhores individuos para a proxima geracao segundo os valores fitness
    for x = 1:Resto
        
        Matriz_pais_X_selecionados(x+Elite,:) = Geracao_bin_X(Melhores_index_XY(x,1),:);
        Matriz_pais_Y_selecionados(x+Elite,:) = Geracao_bin_Y(Melhores_index_XY(x,1),:);
        
    end


end