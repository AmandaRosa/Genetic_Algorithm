% Esta função calcula de bin para dec cada intervalo e calcula a média

function [B] = media_ind (Melhores_turnos)

for i = 1:4
    
    Auxiliar1 = strrep(num2str(Melhores_turnos(i,:)), ' ', '');
    Auxiliar(i) = bin2dec(Auxiliar1);
    Media_individuos(i,1) = Auxiliar(i);
end

B = Media_individuos.'

end