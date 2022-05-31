% Esta função avalia o fitness dos individuos %ARRUMAR AQUI - se o
% coeficiente for maior do que a media daquela faixa aplicar penalidade

function [Resultado] = avaliacao(Individuos,Geracao_inicial, Fitness_coef, Pot_media_ruidos, Matriz_pot_medias)

for i = 1:Individuos
    
    %o melhor individuo é aquele que minimiza
    Resultado(i,1) = abs( sum(Fitness_coef(i,:)) - Pot_media_ruidos);
    
    for j = 1:9
    
    if( Fitness_coef(i,j) > Matriz_pot_medias(1,j)) %sofre penalidade caso não obedeça a potencia média daquela faixa de frequencia
        
        Resultado(i,1) = Resultado(i,1) + 100;
        
    end
    
    end
    
end

end