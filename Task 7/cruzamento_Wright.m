%% Esta função realiza o cruzamento Wright entre os individuos

function [Pais_cruzamento2] = cruzamento_Wright (Pais_cruzamento, Individuos, N, Pc2)

Auxiliar = Pais_cruzamento;
A = 10;
Constante = A*N; 


for loop = 1:500
    
Random = rand(1);
Somatorio1 = 0; 
Somatorio2 = 0;
Somatorio3 = 0;

        if Random>=Pc2

            pai_1 = randi([1 Individuos], 1);
            pai_2 = randi([1 Individuos], 1);

            for i = 1:N

                filho_1(1,i) =  0.5*Auxiliar(pai_1,i) + 0.5*Auxiliar(pai_2,i);
                xi_1 = filho_1(1,i);
                funcao_1 = xi_1*xi_1 - A*cos(2*pi*xi_1);
                Somatorio1 =  Somatorio1 + funcao_1;

                filho_2(1,i) =  1.5*Auxiliar(pai_1,i) - 0.5*Auxiliar(pai_2,i);
                xi_2 = filho_2(1,i);
                funcao_2 = xi_2*xi_2 - A*cos(2*pi*xi_2);
                Somatorio2 =  Somatorio2 + funcao_2;

                filho_3(1,i) =  -0.5*Auxiliar(pai_1,i) + 1.5*Auxiliar(pai_2,i);
                xi_3 = filho_3(1,i);
                funcao_3 = xi_3*xi_3 - A*cos(2*pi*xi_3);
                Somatorio3 =  Somatorio3 + funcao_3;

            end

            fitness_1 = Somatorio1 + Constante;
            fitness_2 = Somatorio2 + Constante;
            fitness_3 = Somatorio3 + Constante;  

            filhos(1,:) = filho_1;
%             disp(filho_1);
            filhos(2,:) = filho_2;
%             disp(filho_2);
            filhos(3,:) = filho_3;
%             disp(filho_3);

            fitness(1,:) = fitness_1;
            fitness(2,:) = fitness_2;
            fitness(3,:) = fitness_3;

            Crescente = sort(fitness);

            Minimo_1 = min(find(Crescente(1,1) == fitness));
            Minimo_2 = min(find(Crescente(2,1) == fitness));

            Auxiliar(pai_1,:) = filhos(Minimo_1,:);
            Auxiliar(pai_2,:) = filhos(Minimo_2,:);
            
        end
end

Pais_cruzamento2 = Auxiliar;

end