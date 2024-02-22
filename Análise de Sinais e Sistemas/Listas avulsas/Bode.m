close all
k=4.01E-5;
a = 2.6E4;
b = 6.02E5;


s = tf('s');
G = (k*s)/(((s/a) - 1)*((s/b) + 10));

bode(G)
xlim([10, 10E7])
title('Diagrama de Bode')
xlabel('Frequência (rad/s)')
ylabel('Magnitude (dB)')

%%
%Segundo diagrama de Bode
close all
k=100;
a = 2;
b = 10;
c = 100;

s = tf('s');
G = (k*(s)*((s/c) +1))/(((s/a) + 1)*((s/b) + 10));

bode(G)
%xlim([10, 10E7])
title('Diagrama de Bode')
xlabel('Frequência (rad/s)')
ylabel('Magnitude (dB)')
