%%
clear 
clc 
close all
t=(-20:0.1:20);
theta = pi.*t/4;
degrau1 = heaviside(t+2) - heaviside(t-2);
f1 = 6*cos(theta).*degrau1;
degrau2 = heaviside(t+2) - heaviside(t+6);
f2 = 6*cos(theta).*degrau2;
degrau3 = heaviside(t-2) - heaviside(t-6);
f3 = -6*cos(theta).*degrau3;
plot(t, f1)
hold on
plot(t, f2)
hold on
plot(t, f3)
hold on
%%
%Conferindo questão do carlinhos, sem gabarito.
clear 
close all
clc

t = 0:0.1:5;
agadete = exp(-t).*heaviside(t);
xisdete = exp(-3*t).*(heaviside(t)-heaviside(t-2));
convolucao = conv(agadete, xisdete);
tlinha = 0:length(convolucao)-1; 

stem(tlinha, convolucao);
%%
%Conferindo questão resolvida ( a partir do zero )
clear
close all
clc
t=-4:0.1:4;
agadete = 2*exp(t).*(heaviside(t+4)-heaviside(t-2));
xisdete = 10.*heaviside(t);
%convolucao = conv(agadete, xisdete);
tlinha = -5:0.05:3;
plot(t, agadete)
hold on 
plot(t, xisdete),
hold on
%%
%Conferindo questão resolvida ( a partir de video no yt)
clear 
close all
clc
dt = 0.1;

t1 = -4:dt:2;
ft1 = 2*exp(t1).*(heaviside(t1+4)-heaviside(t1-2));

t2=0:dt:6;
ft2=10*ones(1,length(t2));

yt = conv(ft1,ft2,'same');

stem(t1, yt*dt);
%%
%Mais uma resposta do Chat GPT
% Define the time vector
t = linspace(-4, 3, 1000); % from 0 to 5 seconds with 1000 samples

% Define two continuous input signals
x = 2*exp(t).*(heaviside(t+4)-heaviside(t-2)); % sine wave
h =10.*heaviside(t); % decaying exponential

% Compute the convolution of x and h
y = conv(x, h, 'same') * (t(2) - t(1));

plot(t, y)








