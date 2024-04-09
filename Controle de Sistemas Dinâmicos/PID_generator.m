close all
clear all
clc


s = tf('s');
funcao = 16/(s*(s+4));
mp = 0.163;
tp = 0.4;
a1 = abs(log(mp));
ksi = sqrt(a1^2/(a1^2+pi^2))
wd = pi/tp
wn = wd/(sqrt(1-ksi^2))
sd = -ksi*wn + i*wd
ang_funcao = angle((16)/(sd*(sd+4)));
ang_compensador = 180 - ang_funcao*180/pi
a = (imag(sd)/tan(ang_compensador*pi/180)) + 4.6;
mod_cav = abs(sd+a);
mod_g = abs(16/(sd*(sd+4)));
k = 1/(mod_g*mod_cav);
compensador = k*((s+a)*(s+abs(real(sd)/10)))/s
