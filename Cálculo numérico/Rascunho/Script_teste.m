%%
clear all
close
clc
tensao = 85.2:0.1:127; %volts
resistencia = 268.82; %ohm
pot = (tensao.^2)/resistencia
plot(tensao, pot)