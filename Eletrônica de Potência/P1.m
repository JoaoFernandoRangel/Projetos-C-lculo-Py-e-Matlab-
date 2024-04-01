close all
t = 0:0.01:4*pi;
r = 127*sqrt(2)*sin(t);
s = 127*sqrt(2)*sin(t-2*pi/3);
T = 127*sqrt(2)*sin(t+2*pi/3);
plot(t, r)
grid on
hold on
plot(t, s)
hold on
plot(t, T)
hold on
plot(t, r-s) %RS
hold on
plot(t, r-T) %RT
hold on
plot(t, s-r) %SR
hold on
plot(t, s-T) %ST
hold on
plot(t, T-r) %TR
hold on
plot(t, T-s) %TS
%%
clear all
close all
clc
V = 127;
Vr = 127*sqrt(2);
alfa = pi/6;
%% MCC 
Vmed = (3*sqrt(3)/(2*pi))*Vr*cos(alfa)
Vef = sqrt(3)*Vr*sqrt((1/6)+(sqrt(3)/(8*pi))*cos(2*alfa))






















