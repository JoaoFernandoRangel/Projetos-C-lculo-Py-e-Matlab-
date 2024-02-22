function [outputArg1,outputArg2] = Bissecao_video(inputArg1,inputArg2)
%recebe intervalo {a,b}
%recebe função f
%recebe Erro E
x = (a + b)/2;
E = 0.0001;
contador = 0;

while (b-a) > E % o intervalo tem que ser maior que o erro escolhido
    if f(a)*f(x) > 0 %se o sinal das f's forem igual o intervalo está errado
        a = x;
    else
        b = x;
    x = (a+b)/2;
    contador = contador + 1;
    end
ret = [ x iter ];
end
end

