clear all
close all 
clc

State = [0 0 0];
s = tf('s');
FT = 400/(s+20); % Entrada em Volts, Saída em Rad/s
%Características do Carro
Raio_roda_direita = 0.065;
Raio_roda_esquerda= 0.065;
Eixo = 0.2;
Raios_media = (Raio_roda_esquerda + Raio_roda_direita)/2;
VelR = FT; %Adicionar Feedback e PID
VelL = FT; %Adicionar feedback e PID
%Cálculo dos valores.
Theta = (1/s)*(Raios_media/(2*Eixo))*(VelR-VelL)*(0.5);
X = (Raios_media*(VelR+VelL))/(2*(s^2) + 2*(Theta^2));
Y = (Raios_media*Theta*(VelR+VelL))/(2*(s^3) + 2*s*(Theta^2));
State = [X Y Theta]
step(15*feedback(X,1));








