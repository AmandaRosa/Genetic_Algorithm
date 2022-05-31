%% Esta funcao calcula f(x) valor fitness do indiv�duo
% considerando a entra uma matrix 1X50 bin�ria 10 bits
% c�lculo do valor da matriz de bin�ria para decimal
%d = bi2de(b) converts a binary row vector b to a decimal integer.

 function [fitness] = calcula_fitness (x)

 for i = 1:50

    fitness(i,1) = (-1*(abs(x(i,1)*sin(sqrt(abs(x(i,1))))))+419);
    
end

