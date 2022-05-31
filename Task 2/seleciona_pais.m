%% Esta função coleta 25 individuos aleatorios na Matriz Geracao Binaria
% a escolha deu-se para os futuros pais 25 individuos aleatorios e 25
% melhores individuos
%a saída sera uma nova matriz de pais selecionados

function [Matriz_pais] = seleciona_pais (Geracao_bin, Fitness)  

%seleciona 25 aleatórios individuos a partir de r
r = randi([1 50],1,25); %ex: r1 = [ 3     1     3     1     1]

    for i = 1:24

        posicao = r(1,i);
        Matriz_pais(i,:) = Geracao_bin(posicao,:);

    end
    
%seleciona os 25 melhores a partir do Fitness e salvar 25 posições,
%recolher essas strings em Geracao_bin

%Lógica = Copia a matriz Fitness, aplica o sort (ordena em ordem
%descrecente). Na matriz fitness original, procurar a posicao dos valores
%encontrados -> pronto, pais selecionados

    Auxiliar = sort(Fitness);

    %Este loop guardar as posições dos 25 menores valores
    for i = 1:25 
        Melhores_individuos(i,1) = min(find(Auxiliar(i,1) == Fitness));
    end  

    %Este loop seleciona os 25 melhores individuos para a proxima geracao segundo os valores fitness
    for x = 1:25
        Matriz_pais(x+25,:) = Geracao_bin(Melhores_individuos(x,1),:);
    end

end




        
    
   
        
    
    
    