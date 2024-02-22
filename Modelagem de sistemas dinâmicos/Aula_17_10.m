close all
clear 
clc
%exercício A.5.11

fq_nat = [1 2 4 6];
damp_frac = [0.3 0.5 0.7 0.8];

a(1:1:4) = fq_nat(1:1:4).^2;

b (1:1:4) = 2*fq_nat(1:1:4).*damp_frac(1:1:4);

for i=1:1:4
    num = [0 0 a(i)];
    den = [1 b(i) a(i)];
    
    funcao = tf(num, den);
    subplot(1,4,i)
    step(funcao) 
    
end
%%
%Exercício A.5.11 Resolução proposta pelo livro
a = [1 4 16 36];
b = [0.6 2 5.6 9.6];
t = 0:0.1:8;
y = zeros(81,4);
for i = 1:4;
num = [a(i)];
den = [1 b(i) a(i)];
y(:,i) = step(num,den,t);
end
plot(t,y(:,1),'o',t,y(:,2),'x',t,y(:,3),'-',t,y(:,4),'-.')
grid
title('Unit-Step Response Curves for Four Cases')
xlabel('t Sec')
ylabel('Outputs')
gtext('1')
gtext('2')
gtext('3')
gtext('4')
%%
% Exercício A.5.15
close all
clear 
clc

fq_nat = 1;
for i=1:1:5
   f_damp(i) = 0 + i*0.2; 
end
num = [ 0 0 fq_nat];
b = 2*fq_nat.*f_damp;
for i=1:length(f_damp)
   den = [1 b(i) fq_nat];
   funcao = tf(num, den);
   subplot(1,5,i)
   step(funcao)
end

%%
close all
clear
clc
t = 0:0.2:12;
for n = 1:6;
num = [1];
den = [1 2*(n-1)*0.2 1];
[y(1:61,n),x,t] = step(num,den,t);
end
plot(t,y)
grid

% To draw a three-dimensional plot, enter the following command: mesh(y) or mesh(y').
% We shall show two three-dimensional plots, one using “mesh(y)” and the other using
% "mesh(y')". These two plots are the same, except that the x axis and y axis are
% interchanged.
mesh(y)
title('Three-Dimensional Plot of Unit-Step Response Curves using Command "mesh(y)"')
xlabel('n, where n = 1,2,3,4,5,6')
ylabel('Computation Time Points')
zlabel('Outputs')
mesh(y')
title('Three-Dimensional Plot of Unit-Step Response Curves using Command "mesh(y transpose)"')
xlabel('Computation Time Points')
ylabel('n, where n = 1,2,3,4,5,6')
zlabel('Outputs')

%%
%Exercício B.5.12
close all
clear 
clc

num = [0 0 36];
den = [1 2 36];
wn = sqrt(den(3))
frac = den(2)/(2*wn)
tp = pi/(wn*sqrt(1-frac^2))%tempo de pico
arg_mp = frac*pi/(sqrt(1-frac^2));
mp = exp(-arg_mp)*100 % maximo overshoot
eq = 1.76*frac^3 - 0.417*frac^2 + 1.039*frac +1;
tr = eq/wn %tempo subida
g = tf(num,den);
ts = 4/(wn*frac)%tempo de assentament
step(g)
%%
close all
clear
clc

control_den = [5 1 0];
control_num = [0 0 1];
ganho_1 = 5;
ganho_2 = [0 4 5];
den_3 = [0 5 1]
num_3 = [0 0 5]
etapa1 = tf(ganho_1.*control_num, control_den);
etapa2 = tf(ganho_2.*control_num, control_den);
etapa3 = tf(num_3, den_3);
inter_3 = feedback(etapa3, 0.8, -1);
novo_den_3 = conv([0 1 0],inter_3.Denominator{1})
tf1 = feedback(etapa1, 1, -1)
tf2 = feedback(etapa2,1,-1)





step(tf1)


%%
close all
%normazilando os vetores
normalizador = tf1.Denominator{1}(1);
novo_den = tf1.Denominator{1}.*(1/normalizador);
novo_num = tf1.Numerator{1}.*(1/normalizador);
wn = sqrt(novo_den(3));
ksi = novo_den(2)/(2*wn);
































