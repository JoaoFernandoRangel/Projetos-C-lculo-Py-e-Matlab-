%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Aluno: João Fernando Rangel
%Rascunho para resolução da primeira lista de exercícios
%Rascunho da lista 1
%Data de criação: 04/03/2023  Ultima modificação: 04/03/2023
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
clear all
t = -10:0.01:10;
tamanho = length(t);
saida = 0:0:100;
%funcao = t*(heaviside(t)-heaviside(t-1));


%degrau 1
for i=1:1:tamanho
    argumento1(i)=(t(i)+2)/4;
    argumento2(i)=(2-t(i))/4;
    argumento3(i)=(t(i)/2);
    argumento4(i)=(-t(i)/2);
    funcao1(i) = argumento1(i)*(heaviside(argumento1(i))-heaviside(argumento1(i)-1));
    funcao2(i) = argumento2(i)*(heaviside(argumento2(i))-heaviside(argumento2(i)-1));
    funcao3(i) = argumento3(i)*(heaviside(argumento3(i))-heaviside(argumento3(i)-1));
    funcao4(i) = argumento4(i)*(heaviside(argumento4(i))-heaviside(argumento4(i)-1));

    saida(i) = funcao1(i) + funcao2(i)+funcao3(i)+funcao4(i);
end
plot(t, saida)
%%

for j=1:1:tamanho
    argumento(j) = ((1/3)*(-t(j))+(1/3)); 
    plotando(j) = 0.5*argumento(j)*(heaviside(-argumento(j)-1) - heaviside(-argumento(j)+1));
end
plot(t,saida)
hold on
plot(t,funcao1)
hold on
plot(t,funcao2)
hold on
plot(t,funcao3)
hold on
plot(t,funcao4)

%plot(t, heaviside(-t(:)-1),'r')
hold on
%plot(t,saida, 'b')
%plot(t,saida)
%%
%Exercício 1.8-6
clear
matriz_coeficientes = [3 2 0; -2 9 -4;0 -4 -15];
t=0:001:1;
syms y1 y2 y3  sol1 sol2 sol3
yn = [y1 ;y2 ;y3];

x = (2-abs(cos(t)))*heaviside(t-1);
inicio =  matriz_coeficientes*yn;

A = solve (inicio(1)== x, inicio(2)==0, inicio(3)==0);








