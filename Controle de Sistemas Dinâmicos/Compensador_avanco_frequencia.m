%{
Códigos para estudo de resposta em frequência
%}
close all
clear all
clc

s = tf('s');
G = 0.005/(s*(s+0.05));
ts = 18; %segundos pre requisito
Mp = 0.25; %amplitude pre requisito = 0.3 
%nao funcionou foi mudado para 0.25

ksi_desejado = abs(log(Mp))/(sqrt(pi^2 + log(Mp)^2))
wd_desejado = (pi - acos(ksi_desejado))/ts
wn_desejado = wd_desejado/sqrt(1-ksi_desejado^2)
pm = 100*ksi_desejado + 5 %% graus
angulo_do_bode = 180 - 156; %graus
phi_d = (pm-angulo_do_bode) %graus
phi = phi_d*(pi/180); %radiano
alfa = (1-sin(phi))/(1+sin(phi))
T = 1/(sqrt(alfa)*wn_desejado) %wn_desejado = wc
ganho = 10*sqrt(alfa)*abs(0.005/((1i*wn_desejado+0.05)*(1i*wn_desejado)))
C = ganho*(T*s+1)/(T*alfa*s+1)
figure(1)
bode(G, 'r')
hold on
bode(G*C, 'b')
grid on
legend('Não Compensado', 'Compensado');
figure(2)
step(feedback(G,1), 'r');
hold on
step(feedback(G*C,1), 'b');
grid on
legend('Não Compensado', 'Compensado');

