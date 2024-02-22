%%
%
%
%
%
%
%
%%
%Questão 1
clear all
close 
clc

n=[0:1:10];

for i=1:1:length(n)
    x(i)= cos((n(i)*pi/12)+pi/4); 
end
stem(x)
%%
%exemplo
clear all
close 
clc
n = (0:10)';
y= [4;13;zeros(length(n)-2,1)];
x = (3*n+5).*(n>=0);
for k = 1:length(n)-2
    y(k+2) = 5*y(k+1) -6*y(k) + x(k+1) -5*x(k);
end
clf;
stem(n,y,'k');
xlabel('n');
ylabel('y[n]')
disp(' n    y');
disp([num2str([n,y])]);
%%
%Questão 2
clear all
close 
clc
n=(0:10);
y(1)=1;
x(1:10) = 1;
for k = 1:length(n)-2
    y(k+1) = x(k) - 2*y(k);    
end
stem(y);
y
%%
%Questão 3
clear all
close 
clc
n = -10:1:10;
f = inline('exp(-n/5).*cos(n*pi/5).*(n>=0)');
% for i=1:1:21
%    if i<11
%       g(i)=0; 
%    else
%     g(i)= f(i);
%    end
% end

stem(n, f(n));
ylabel(' f[n] ');
%%
%Questão 4
clear all
close
clc
syms s z
a = [1 -2];
b = [1 3 2];
[r,p,k] = residuez(a,b);
funcao = 0;
for i=1:2
   funcao = funcao + r(i)/(1-((p(i))*z^(-1))); 
end
funcao
%%
% clear all
% close
% clc






