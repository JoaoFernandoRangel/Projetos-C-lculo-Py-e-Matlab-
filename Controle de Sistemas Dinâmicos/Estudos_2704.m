clear all
close all
clc

s = tf('s');
G = 1/((s+5)*(s+10));
ts = 0.1; %segundos pre requisito
Mp = 0.1; %amplitude pre requisito = 0.3 
%nao funcionou foi mudado para 0.25
figure(1)
step(feedback(G,1))
grid on
figure(2)
bode(G)
grid on
%%
close all
figure(1)
bode(G)
grid on
ksi_desejado = abs(log(Mp))/(sqrt(pi^2 + (log(Mp))^2))
wd_desejado = (pi - acos(ksi_desejado))/(ts)
wn_desejado = wd_desejado/sqrt(1-ksi_desejado^2)
pm = 100*ksi_desejado + 5 %% graus
angulo_do_bode = 180 - 150; %graus
phi_d = (pm-angulo_do_bode) %graus
phi = phi_d*(pi/180); %radiano
alfa = (1-sin(phi))/(1+sin(phi))
T = 1/(sqrt(alfa)*wn_desejado) %wn_desejado = wc
ganho = 10*sqrt(alfa)*abs(1/((1i*wn_desejado+5)*(1i*wn_desejado+10)))
C = 1*(T*s+1)/(T*alfa*s+1)
ganho
C = 100*ganho*(T*s+1)/(T*alfa*s+1);
figure(2)
step(feedback(G,1), 'b')
hold on
step(feedback(G*C,1), 'r')
grid on
%%
clear all
close all
clc
mp = 0.15;
ksi = abs(log(mp))/sqrt(pi^2+(log(mp))^2);
s = tf('s');
G = 97.7/((s+2)*(s+5)*(s+7));
hold on
bode(G)
grid on
%%
clear all
close all
clc
mp = 0.15;
ksi = abs(log(mp))/sqrt(pi^2+(log(mp))^2);
s = tf('s');
G = 350/((s)*(s+7));
hold on
bode(G)
grid on
%%
clear all
close all
clc


s = tf('s');
G = 10/((s+1)*(s+2));
bode(G)
grid on
hold on
C = (s+0.59)/(s+0.27);
bode(G*C)
%%
close all
step(feedback(G,1), 'r');
hold on
step(feedback(G*C,1), 'b');
grid on
%%
clear all
close all
clc

s = tf('s');
g = 0.005/(s*(s+0.05));
step(feedback(g,1), 'r');
grid on
hold on
c = 2.113*(11.816*s+1)/(6.392*s+1);
step(feedback(g*c,1), 'b');
%%
close all
bode(g, 'r')
hold on
compensado = g*c;
bode(compensado, 'b')
grid on





















