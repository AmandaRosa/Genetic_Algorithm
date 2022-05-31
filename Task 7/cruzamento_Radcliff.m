%% Esta função realiza o cruzamento Radcliff entre os individuos

function [Pais_Rad_cruzamento] = cruzamento_Radcliff (Melhores_individuos, Individuos, N, Pc)

Beta = rand(1);
Pais_cruzamento = Melhores_individuos;

pai_1 = randi([1 Individuos], 1);
pai_2 = randi([1 Individuos], 1);

pai_ind_1 = Melhores_individuos(pai_1,:);

pai_ind_2 = Melhores_individuos(pai_2,:);

for loop = 1:500
    Random = rand(1);

        if Random>=Pc
            for j = 1:N

                Pais_cruzamento(pai_1,j) = (Beta*pai_ind_1(1,j) + (1-Beta)*(pai_ind_2(1,j)));
                Pais_cruzamento(pai_2,j) = (Beta*pai_ind_2(1,j) + (1-Beta)*(pai_ind_1(1,j)));

            end
        end
end

Pais_Rad_cruzamento = Pais_cruzamento;

end