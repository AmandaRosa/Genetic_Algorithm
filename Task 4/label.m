%Esta função colore a tabela do scheduling

function [Table_final] = label(Table)
%COLOR Summary of this function goes here
%   Detailed explanation goes here
for i = 1:4
    for j = 1:7
        if(Table(i,j) == 0)
            Table_final(i,j) = '+';
        elseif(Table(i,j) == 1)
            Table_final(i,j) = ' ';
        else
            Table_final(i,j) = Table(i,j);
        end
    end
end

end

