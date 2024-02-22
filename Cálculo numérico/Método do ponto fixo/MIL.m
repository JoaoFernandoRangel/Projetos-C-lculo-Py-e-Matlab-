function [ zero , it ] = MIL( xv, Phi, Tol )
%MPF Aplica o método do ponto fixo
% xv é o valor inicial de x
% Phi é a função de iteração
% Tol é a tolerância (erro máximo aceitável)
it = 0;
xn = double(Phi(xv));
while abs(xn-xv) > Tol
xv = xn;
xn = double(Phi(xv));
it = it + 1;
end
zero=double(xn);

end