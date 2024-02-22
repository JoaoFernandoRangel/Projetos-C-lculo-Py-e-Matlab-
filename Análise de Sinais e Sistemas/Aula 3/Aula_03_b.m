%***********************************************************
%Aula_03_b
%
%Versão 1: 14/03 Ultimo modificado em:14/03/23
%Nome: João Fernando Rangel Guimarães
%Análise de circuito RC
%************************************************************
clear
close all
clc
f=10:100;
impedancia_cap=(3.18*0.001*2*pi*f);
imaginario=(0.5+(impedancia_cap)*1i);
vs = 50./imaginario;
stem(f, abs(vs), 'r*')
hold on
stem(f, imag(vs), 'b-')
hold on
stem(f, real(vs), 'g*')
