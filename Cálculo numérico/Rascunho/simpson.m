function [area] = simpson(intervalo,espacos,f)
%SIMPSON Summary of this function goes here
%   Detailed explanation goes here
dx = (intervalo(1,2)-intervalo(1,1))/espacos;
valores_x =intervalo(1,1):dx:intervalo(1,2);
%f =@(x) polyfit(valores_x,vetor_de_y, length(vetor_de_y)-1);
%f(x0) + f(xn)
areaInicial = f(intervalo(1,1))+ f(intervalo(1,2));
%somando os f(ximpares)
somaImpares = 0;
somaPares = 0;
for i=2:(length(valores_x)-1)
    %x0 x1 x2 x3 x4
    %1  2  3  4  5
    if mod(i,2)==0 %determina se é par
    somaImpares = somaImpares + 4*f(valores_x(i));
    else
    somaPares = somaPares + 2*f(valores_x(i));
    end
end
area = (areaInicial + somaImpares + somaPares)*(dx/3);



