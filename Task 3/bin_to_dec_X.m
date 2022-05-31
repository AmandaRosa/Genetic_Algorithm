%%% Esta função transforma a matriz binária X em matriz decimal

function [Geracao_dec_X] = bin_to_dec_X (Geracao_bin_X)

    for i = 1:50
        Individuo_str = strrep(num2str(Geracao_bin_X(i,:)), ' ', '');
        Auxiliar = bin2dec(Individuo_str);
        Geracao_dec_X(i,1) = (Auxiliar*4)/1023;
    end

end
