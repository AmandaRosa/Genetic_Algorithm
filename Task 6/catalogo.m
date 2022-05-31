%esta função ira me retornar o catalogo, casa e coordenadas

function [Casa] = catalogo()


x = 1;

for i = 1:8
    for j = 1:8
        
        Casa(x,1) = x;
        Casa(x,2) = i;
        Casa(x,3) = j;
        x = x+1;
    end
end

disp(Casa);

end