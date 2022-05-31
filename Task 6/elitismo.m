% Esta função ira coletar os 5 melhores percursos e inteirar o restante com
% aleatoriedade

function [Pais_elitismo] = elitismo (Pop_inicial, Individuos, Avaliacao, Elite, Grupo_Torneio)

elite = Elite;
Auxiliar = sort (Avaliacao, 'descend');


%Este loop guardar as posições dos menores valores
    for i = 1:elite

        Posicao = min(find(Auxiliar(i) == Avaliacao));
        Pais_elitismo(i,:) = Pop_inicial(Posicao,:);

    end

    resto = Individuos - elite;
    
    %% realizar torneio
    % for com a quantidade de loops = qde de torneios (50 torneios)
    for i = 1:resto
        %selecionados randi para o torneio o teste será uma disputa 3 a 3 em
        %uma matriz de 10 individuos
        
        
        r = randi([1 Individuos],1,Grupo_Torneio); %arrumar para o usuário escolher quantos individuos disputaram o torneio

        %numero individuos selecionados para o torneio => neste caso: 3
        for j = 1:Grupo_Torneio

            Auxiliar(j,1) = Avaliacao(r(1,j),1);

        end

        %agora verificar quem vence o torneio
        Maximo_torneio = max(Auxiliar);
        Index_XY = min(find(Avaliacao == Maximo_torneio));

        %colocar este par XY selecionado no torneio na matriz de pais
        %selecionados

       Pais_elitismo(i+elite,:) = Pop_inicial(Index_XY,:);
       Pais_elitismo(i+elite,:) = Pop_inicial(Index_XY,:);

    end

end