function [ret,iter] = Bissec(a,b,f,E)
%bissec aplica o método da bisseção
%aproxima um zero de f isolado no intervalo [a,b], com tolerância E
%Retorna o valor de x aproximado e o numero de iterações
tic;
x = (a+b)/2;
iter = 0;

while (b-a) > E
    if f(a)*f(x)>0
        a = x;
    else                                                     
        b = x;
    end
    x = (a+b)/2;
    iter = iter + 1;
end
toc
ret = [x iter];
end








