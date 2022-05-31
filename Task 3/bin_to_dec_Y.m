%%% Esta função transforma a matriz binária X em matriz decimal

function [Geracao_dec_Y] = bin_to_dec_Y (Geracao_bin_Y)

    for i = 1:50

        Individuo_str = strrep(num2str(Geracao_bin_Y(i,:)), ' ', '');
        Auxiliar = bin2dec(Individuo_str);
        Geracao_dec_Y(i,1) = (Auxiliar*2)/1023;

    end
end