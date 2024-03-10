%%Código para compensador em avanço
% Utiliza o método 2
clear all
Mp = 0.16;
Tp = 0.91;

dampf = abs(log(Mp))/(sqrt(pi^2-(log(Mp)^2)));
wd = pi/Tp;
wn = pi/(Tp*sqrt(1-dampf^2));
p_desejado = dampf*wn + i*wd;
angulop = angle(p_desejado)*180/pi;
180 - angulop;
d = 3.4523/tan(angulop*pi/180);
s = tf('s');
ftma = 10/(s*(s+2));
kc = (1/10)*abs(p_desejado+7.1260)*abs(p_desejado);
compensador = kc*(s+2)/(s+7.1260);
FTMA = compensador*ftma;
step(feedback(FTMA,1))
grid on
hold on
step(feedback(ftma,1))
%%
clear all
close all
clc

p = -0.3307 + i*0.5864;
modulo = abs(p);
angulo = angle(p); % em radianos
cos(pi - angulo);
kv = 1.06/3
%%
clear all
close all
clc

s = tf('s');
ftma = 10/(s*(s+1));
cs = 0.556*(s+1)/(2*s+1);

step(feedback(ftma,1));
grid on
hold on
step(feedback(cs*ftma,1))

%%
close all
ftmf = feedback(ftma,1)
bode(ftmf)
hold on
bode(feedback(cs*ftma,1))
close all
rlocus(feedback(cs*ftma,1))







