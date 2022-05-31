%Esta função colore a tabela do scheduling

function [] = color(Table)
%COLOR Summary of this function goes here
%   Detailed explanation goes here
for i = 1:4
    for j = 1:7
        if(Table(i,j) == 0)
            app.UITable.BackgroundColor = [1 1 .9];
       else
            app.UITable.BackgroundColor = [.9 .95 1];
        end
    end
end

end

