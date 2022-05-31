%% Esta funcao realiza mutacao nos individuos da proxima geracao

function [Matriz_novageracao] = mutacao (Matriz_saida)

Matriz_novageracao = Matriz_saida;

%seleciona duas strings aleatorias da matriz e realiza o crossover em uma
for i = 1:50
 
%utilizar porcentagem de Pc = 0.6, se p>=Pc o crossover ocorre
    p = rand(1,1);

        if(p<=0.01)
            %posição cross over aleatoria
            posicao = randi([1 10], 1);
    
            Matriz_novageracao = Matriz_saida;
 
            %selecao um individuo para sofrer mutacao
            mutante = randi([1 50], 1);
            
            % trocar o bit pelo inverso na posicao no individuo mutante
            Matriz_novageracao(mutante,posicao) = not(Matriz_novageracao(mutante,posicao));
        end  
    end  
end  