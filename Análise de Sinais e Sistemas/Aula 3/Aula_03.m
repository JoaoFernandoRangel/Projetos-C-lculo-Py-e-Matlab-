%***********************************************************
%Aula_03
%
%Versão 1: 14/03 Ultimo modificado em:14/03/23
%Nome: João Fernando Rangel Guimarães
%Introdução aos números complexos
%************************************************************
%%
clear 
close all
clc


c = [1+2i 2+3i 3+4i];
real_c=real(c);
imag_c=imag(c);
angle_c=angle(c);%resposta em radianos
angle_c_deg=angle_c*180/pi;
abs_c=abs(c);
tamanho_c=size(c);
t=1:tamanho_c(2);
%figure (1)
%plot(t,abs_c)
n=1:0.1:10;
vetor_exponencial = exp(n);
%figure(2)
%stem(n, vetor_exponencial, 'r*')%plota o gráfico com traços abaixo dos pontos
%%
syms va vb
[va,vb]=solve(5*va+3*vb==5,3*va+5*vb==-1);
d_va=double(va);
d_vb=double(vb);






%%

