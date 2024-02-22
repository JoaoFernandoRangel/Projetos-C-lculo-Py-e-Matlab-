function y = Back_sub(a,b)
%a é a matriz dos coeficientes
%b é a matriz dos resultados
n = length(b);%retorna 3
y(n,1) = b(n)/a(n,n);
for i = n-1:-1:1
    y(i,1)=((b(i)-a(i,i+1:n)*y(i+1:n,1))./a(i,i));
    pause
end