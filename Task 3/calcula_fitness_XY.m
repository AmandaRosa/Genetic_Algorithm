%% Esta funcao calcula f(x) valor fitness do indivíduo
% considerando a entra uma matrix 1X50 binária 10 bits
% cálculo do valor da matriz de binária para decimal
%d = bi2de(b) converts a binary row vector b to a decimal integer.

 function [Fitness_XY] = calcula_fitness (x,y)

 for i = 1:50 %onde n é o numero de iterações

    Fitness_XY(i,1) = (10+ (x(i,1)*sin(4*x(i,1))) + (3*sin(2*y(i,1))));
    
   
end

