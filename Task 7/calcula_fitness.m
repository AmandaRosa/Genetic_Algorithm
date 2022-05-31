%Esta função calcula o fitness de cada individuo

function [Fitness] = calcula_fitness (Geracao_inicial, Individuos, N)

A = 10;

x = Geracao_inicial;


Somatorio = 0;

for linha = 1:Individuos
    
    Somatorio = 0;
    
    for n = 1:N

        constante = A*n;
        x = Geracao_inicial(linha,n);
        funcao = (x.*x - A*cos(2*pi.*x));
        Somatorio = Somatorio + funcao;
        fitness(linha,1) = Somatorio + constante;

    end    
end       

disp(Somatorio);
Fitness = fitness(:,1);

end