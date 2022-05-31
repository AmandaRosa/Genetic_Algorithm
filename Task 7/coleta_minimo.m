%Esta função coleta os melhores individuos - ou seja, aqueles que
%apresentam a minimização da função

function [Pais_elitismo, Melhores_encontrados, Melhores_Fitness] = coleta_minimo(Geracao_inicial,Fitness, Individuos,N, Elite, Grupo_torneio)

elite = Elite;
Auxiliar = sort (Fitness);

%Este loop guardar as posições dos menores valores
    for i = 1:elite

        Posicao = min(find(Auxiliar(i) == Fitness));
        Pais_elitismo(i,:) = Geracao_inicial(Posicao,:);
        Melhores_encontrados(i,:) = Geracao_inicial(Posicao,:);
        Melhores_Fitness(i,:) = Auxiliar(i); 

    end

resto = Individuos - elite;

     %selecionados randi para o torneio o teste será uma disputa 3 a 3 em
        %uma matriz de 10 individuos
        for i = 1:resto
        
        r = randi([1 Individuos],1,Grupo_torneio); %arrumar para o usuário escolher quantos individuos disputaram o torneio

        %numero individuos selecionados para o torneio => neste caso: 3
        for j = 1:Grupo_torneio

            Auxiliar(j,1) = Fitness(r(1,j),1);

        end

        %agora verificar quem vence o torneio
        Minimo_torneio = min(Auxiliar);
        Index_XY = min(find(Minimo_torneio == Fitness));

        %colocar este par XY selecionado no torneio na matriz de pais
        %selecionados

       Pais_elitismo(i+elite,:) = Geracao_inicial(Index_XY,:);
       Pais_elitismo(i+elite,:) = Geracao_inicial(Index_XY,:);

    end
    
end