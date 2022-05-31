%% Esta função transforma a matriz binária em matriz decimal

function [Geracao_dec] = bin_to_dec (Geracao_bin)

for i = 1:50
Individuo_str = strrep(num2str(Geracao_bin(i,:)), ' ', '');
Auxiliar = bin2dec(Individuo_str);
Geracao_dec(i,1) = (Auxiliar*512)/1023;
end

