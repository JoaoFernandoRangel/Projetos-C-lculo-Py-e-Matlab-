clear 
close all
clc
p = 17.616;
d = (14*p-1431.46)/191.38
t = -6.191*191.38 + 1431.46;
tl = t/14;
%%
clear 
close all
clc
d = -6.191:0.1:26.191;%iterações de valores para D
p = 17.616:0.1:50;%iterações de valores para P
v = 10717.*d.^2-196.*p.^2+ 19256.44.*p.*d + 99299.76.*d - 17484.82.*p + 141746;
%acima, expressão encontrada a partir do critério de Routh

for i=1:1:length(v)
   if v(i)> 0 %verifica a condição encontrada
      v(i); % imprime o valor da expressão 
      p(i); %valor de P
      d(i); %valor de d
      i;
      break
   end  
    
end






