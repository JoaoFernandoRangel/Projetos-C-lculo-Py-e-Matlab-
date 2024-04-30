close all
clear all
clc


s = tf('s');
funcao = 400/(s*(s+20));
mp = 0.1;
tp = 0.1;
a1 = abs(log(mp));
ksi = sqrt(a1^2/(a1^2+pi^2))
wd = pi/tp
wn = wd/(sqrt(1-ksi^2))
sd = -ksi*wn + i*wd
ang_funcao = (180/pi)*angle((400)/(sd*(sd+20)))
ang_compensador = 180 - ang_funcao%*180/pi
a = (imag(sd)/tan(ang_compensador*pi/180)) - real(sd);
mod_cav = abs(sd+a);
mod_g = abs((400/(sd*(sd+20)))*(1/51)*(180/pi)*(1/22));
k = 1/(mod_g*mod_cav)
compensador = k*((s+a)*(s+abs(real(sd)/10)))/s
