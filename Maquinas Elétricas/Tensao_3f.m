clear all
close all
clc

t = 0:0.001:0.05;
fase1 = 127*cos(2*pi*60*t);
fase2 = 127*cos(2*pi*60*t - 2*pi/3);
fase3 = 127*cos(2*pi*60*t + 2*pi/3);
entrefases = fase2 - fase1;
plot(t, fase1);
grid on
hold on
plot(t, fase2);
hold on
plot(t, entrefases);
hold on