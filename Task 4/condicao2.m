%Esta função visa não deixar que nenhuma produção seja negativa nos 4
%intervalos 

function [Producao_nova, Geracao_nova] = condicao2 (Producao, Geracao)

Geracao_nova = Geracao;
Producao_nova = Producao;

for i = 1:4
    
    if(Producao(i) < 0) %acionar máquina aleatória para producao ficar positiva
        
        zero = max(find(Geracao(i,:)==0));
        disp(zero);
        if(zero == 1)
            if(i == 1)
                Geracao_nova(1,1) = 1;
                Geracao_nova(2,1) = 0;
                Geracao_nova(3,1)= 0;
                Geracao_nova(4,1) = 1;
                Auxiliar = producao(Geracao_nova);
                Producao_nova(i) = Auxiliar(i);
                
            elseif (i==2)
                Geracao_nova(1,1) = 1;
                Geracao_nova(2,1) = 1;
                Geracao_nova(3,1)= 0;
                Geracao_nova(4,1) = 0;
                Auxiliar = producao(Geracao_nova);
                Producao_nova(i) = Auxiliar(i);
                
            elseif(i==3)
                Geracao_nova(1,1) = 0;
                Geracao_nova(2,1) = 0;
                Geracao_nova(3,1)= 1;
                Geracao_nova(4,1) = 1;
                Auxiliar = producao(Geracao_nova);
                Producao_nova(i) = Auxiliar(i);
            else
                Geracao_nova(1,1) = 1;
                Geracao_nova(2,1) = 0;
                Geracao_nova(3,1)= 0;
                Geracao_nova(4,1) = 1;
                Auxiliar = producao(Geracao_nova);
                Producao_nova(i) = Auxiliar(i);
            end
        
        elseif(zero == 2) 
         if(i == 1)
                Geracao_nova(1,1) = 1;
                Geracao_nova(2,1) = 0;
                Geracao_nova(3,1)= 0;
                Geracao_nova(4,1) = 1;
                Auxiliar = producao(Geracao_nova);
                Producao_nova(i) = Auxiliar(i);
                
            elseif (i==2)
                Geracao_nova(1,1) = 1;
                Geracao_nova(2,1) = 1;
                Geracao_nova(3,1)= 0;
                Geracao_nova(4,1) = 0;
                Auxiliar = producao(Geracao_nova);
                Producao_nova(i) = Auxiliar(i);
                
            elseif(i==3)
                Geracao_nova(1,1) = 0;
                Geracao_nova(2,1) = 0;
                Geracao_nova(3,1)= 1;
                Geracao_nova(4,1) = 1;
                Auxiliar = producao(Geracao_nova);
                Producao_nova(i) = Auxiliar(i);
            else
                Geracao_nova(1,1) = 1;
                Geracao_nova(2,1) = 0;
                Geracao_nova(3,1)= 0;
                Geracao_nova(4,1) = 1;
                Auxiliar = producao(Geracao_nova);
                Producao_nova(i) = Auxiliar(i);
         end
         
        else
        
            maquina = zero;
            Geracao_nova(i,maquina) = 1;
            Maximo = max(Producao);
            Index_Max = find(Producao == Maximo);
            Geracao_nova(Index_Max,maquina) = 0;
            Auxiliar = producao(Geracao_nova);
            Producao_nova = Auxiliar;
        end  
    end
end

end


