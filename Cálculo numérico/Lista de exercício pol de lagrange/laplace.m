function [funcao] = lagrange(x,y)
%LAPLACE Faz uma interpolação para um polinomio de la place
syms x
n=length(A);
soma = 0;

for k=1:n
prod = 1;
for i=1:n % acumula o p_j(X)
if i ~= k
prod = prod*(x-A(1,i))/(A(1,k)-A(1,i));
end
end
soma = soma+A(2,k)*prod; % acumula o polinômio interpolador
end


end

end

