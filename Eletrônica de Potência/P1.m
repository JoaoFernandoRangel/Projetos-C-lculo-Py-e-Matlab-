clear 
clc
close all
t=0:0.0001:0.01;
i = 10.29*sin(2*pi*50*t+0.309) - 3.12*exp(-100*t);
plot(t,i)
grid on
