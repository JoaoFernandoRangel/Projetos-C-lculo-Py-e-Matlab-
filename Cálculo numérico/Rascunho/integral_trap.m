function [val] = integral_trap(intervalo,espacos,funcao)

dx = (intervalo(1,2)-intervalo(1,1))/espacos;
valor = 0;
for i=0:espacos
    valor = valor + (dx/2)*(funcao(intervalo(1,1)+(i)*dx)+funcao(intervalo(1,1)+(i+1)*dx));
end
val = valor;
end

