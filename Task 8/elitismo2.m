%% Esta função visa selecionar os melhores valores de x encontrados na geração analisada


function [Geracao_pais] = elitismo2(Geracao, Penalidades, Individuos, Elite, Grupo_torneio)

Melhores_fitness = sort(Penalidades);

for i = 1:Elite
    
    Melhores_fitness(i,1) = Penalidades(i,1);

end

for i = 1:Elite
   
    Melhores_index(i,1) = min(find(Melhores_fitness(i,1) == Penalidades));
    Melhores_individuos(i,:) = Geracao(Melhores_index(i,1),:);
    
end

Resto = Individuos - Elite;

     %selecionados randi para o torneio o teste será uma disputa 3 a 3 em
     %uma matriz de 10 individuos
     for i = 1:Resto
         
         r = randi([1 Individuos],1,Grupo_torneio); %arrumar para o usuário escolher quantos individuos disputaram o torneio
         
         %numero individuos selecionados para o torneio => neste caso: 3
         for j = 1:Grupo_torneio
             
             Auxiliar(j,1) = Penalidades(r(1,j),1);
             
         end
         
         %agora verificar quem vence o torneio
         Minimo_torneio = min(Auxiliar);
         Index = min(find(Minimo_torneio == Penalidades));
         
         %colocar este par XY selecionado no torneio na matriz de pais
         %selecionados
         
         Melhores_individuos(i+Elite,:) = Geracao(Index,:);
         
     end
Geracao_pais = Melhores_individuos;

end