close all
clear
clc

n1 = 7;%João
n2 = 3;%Biancardi
s = tf('s');
ftma = (2*n1*(s+4))/(s*(s+5/n2)*(s+n1-1)*(s+n1+n2));
polos_ma = roots(ftma.Denominator{1});
ftmf = feedback(ftma, 1);
polos_mf = roots(ftmf.Denominator{1});
grid on
step(ftmf)

%%
%step(ftmf);
%Tempo de subida de 2s. marginalmente atende ao critério estabelecido
ftma_redux = (s*n1*(s+4))/((s+5/n2)*(s));
ftmf_redux = feedback(ftma_redux,1);
step(ftmf_redux)
hold on
step(ftmf)
%%
clear 
clc
Gn = 33.533;
steady_error = 1/Gn;








