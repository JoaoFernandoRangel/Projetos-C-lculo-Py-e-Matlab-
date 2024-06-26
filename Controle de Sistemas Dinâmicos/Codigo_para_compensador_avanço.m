%%
%Base paraq descobrir C(s)
close all
clc;
clear all;
s = tf('s');
MP = 0.16;
TP = 0.91;
EP = sqrt(((log(MP))^2)/((pi^2)+((log(MP))^2)));
WD = pi/TP;
WN = (WD)/(sqrt(1-(EP^2)));
Polo1 = -EP*WN + i*WD;
Polo2 = -EP*WN - i*WD;

%Verificar se o polo desejado faz parte do LGR como polo de MF:
num = 5;
den1 = Polo1*(0.5*Polo1 + 1);
den2 = Polo2*(0.5*Polo2 + 1);

arg1 = angle(num);
arg2 = angle(Polo1);
arg3 = angle(den1/Polo1);

arg4 = angle(Polo2);
arg5 = angle(den2/Polo2);

Gp1ang = ((arg1 - arg2 - arg3)*180)/pi; %transformando rad para graus
Gp2ang = ((arg1 - arg4 - arg5)*180)/pi; %transformando rad para graus

Cp1 = -180 - Gp1ang
Cp2 = -180 - Gp2ang;

%%
%Solução 2
s = tf('s');
a1 = abs(real(Polo1)) %absoluto da parte real do polo
a2 = abs(real(Polo2)); %absoluto da parte real do polo

passo1 = ((angle(Polo1 + a1))*180)/pi; %calculo do angulo de polo1 + a1
passo2 = passo1 - Cp1;
passo3 = ((angle(Polo2 + a2)*180))/pi; %calculo do angulo de polo2 + a2
passo4 = passo3 - Cp2;

b1 = (abs(imag(Polo1))/(tan((passo2*pi)/180))) + a1
b2 = (abs(imag(Polo2))/(tan((passo4*pi)/180))) + a2;

k = (abs(1/num)*abs(den1)*abs(Polo1+b1))/(abs(Polo1+a1))
Compensador_sol_2 = k * (s+a1)/(s+b1)
ftma = 10/(s*(s+2));
FTMA = ftma*Compensador_sol_2;
step(feedback(FTMA,1))
hold on
step(feedback(ftma,1))
grid on
%%
%Solução 3.
gamma = (Cp1*pi)/180;
a1 = abs(real(Polo1)) - (tan(gamma/2)*abs(imag(Polo1)))
b1 = abs(real(Polo1)) + (tan(gamma/2)*abs(imag(Polo1)))

k = (abs(1/num)*abs(den1)*abs(Polo1+b1))/(abs(Polo1+a1))
%%
%Bode
Cp1value = k * ((Polo1+a1)/(Polo1+b1));
%Cp2value = k * ((Polo2+a2)/(Polo2+b2));
FTMA = 5/(s*(0.5*s+1));
bode(feedback(FTMA,1))
grid on
hold on
FTMA_Com_Cs = FTMA*k*((s+a1)/(s+b1));
close all
bode(feedback(FTMA_Com_Cs,1))
grid on
%%
clc




