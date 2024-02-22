clear all
close all
clc

n1 = 7;%João
n2 = 3;%Biancardi
s=tf('s');
%p = 6.8:0.2:100;
k = 5;
ftma = (2*n1*(s+4))/(s*(s+5/n2)*(s+n1-1)*(s+n1+n2));
ftmf = feedback(ftma,1);
%rlocus(ftma)
rltool(ftma)
%for i=1:1:length(p)
 %   new_ftma = p(i).*ftma;
  %  ftmf = feedback(new_ftma,1);
   % step(ftmf)
    %%old on   
    
%end

%rltool(ftma)

%%
ramp = 1/s^2;
rltool(ftma)
%%
close all
clear
clc
%p = -99:1:100;
d = -20:0.1:100;
p = 30;
beta_num = 10717.28.*d.^2 - 196*p^2 + 1895.32*p.*d + 1155.48*p + 99299.2.*d + 153145;
beta_den = 1431.45 + 191.38.*d - 14*p;
valor = beta_num./beta_den;
plot(d,valor);
axis([d(1) d(length(d)) 0 valor(length(d))])
grid on
for i=1:1:length(valor)
   check = valor(i);
   if check > 0
       d(i)
   end
    
end
%%
clear 
close all
clc
x=-10:0.01:10;
num = 11.06.*x.^2 -2202.66.*x -8101;
den = 0.79.*x - 81.01;
check = 1;
for i=1:1:length(x)
   beta(i) = num(i);
   if beta(i)>0
       x(i)% para valores de x>-7.14 beta é positivo
       break
   end
    
end

















