close all
clear 
clc

eq1 = [1 9 9];
roots(eq1)
eq2 = [ 1 2 9];
roots(eq2)
%%
%Questão 12. Cap 4. Norman Nise
close all
clear 
clc

num = [0 10 0];
den = [1 20 500];
g = tf(num, den);
step(g)
%%
%Questão 14. Cap 4. Norman Nise
close all
clear 
clc

massa = 1;
mola = 5;
atrito = 1;
num = [0 0 mola];
den = [massa atrito mola];
roots(den)
g = tf(num, den);
subplot(2,1,1)
step(g)
subplot(2,1,2)
impulse(g)
%%
close all
clear
clc

eq1 = [1 6 144];
roots(eq1)
%%
close all
clear
clc

eq1 = [1 100 100*100];
roots(eq1)
%%
close all
clear
clc

frac = 0.246;
freq = 3240;
eq = 1.76*frac^3 - 0.417*frac^2 + 1.039*frac +1;
eq/freq
%%
close all
clear 
clc

num = [0 0 1.05e7];
den = [1 1.6e3 1.05e7];
g = tf(num, den);
step(g)
%%
close all
clear 
clc

Mp = 0.1;
lg = log(Mp);
frac = lg/(sqrt(pi^2 + lg^2))

%%
close all
clear 
clc

Mp = 0.123;
lg = log(Mp);
frac = lg/(sqrt(pi^2 + lg^2))
w = 4 /frac
%%
close all
clear 
clc

num = [0 0 0.2];
den = [1 1 5.6];
wn = sqrt(den(3))
frac = den(2)/(2*wn)
tp = pi/(wn*sqrt(1-frac^2))
arg_mp = frac*pi/(sqrt(1-frac^2));
mp = exp(-arg_mp)*100
eq = 1.76*frac^3 - 0.417*frac^2 + 1.039*frac +1;
tr = eq/wn
g = tf(num,den);
ts = 4/(wn*frac)
step(g)
%%
close all
clear 
clc

damp = 1.53;
mola = 1.92;
mom = 1.07;

num = [0 0 1/mom];
den = [1 mola/damp mola/mom];
wn = sqrt(den(3))
frac = den(2)/(2*wn)
tp = pi/(wn*sqrt(1-frac^2))
arg_mp = frac*pi/(sqrt(1-frac^2));
mp = exp(-arg_mp)*100
eq = 1.76*frac^3 - 0.417*frac^2 + 1.039*frac +1;
tr = eq/wn
g = tf(num,den);
ts = 4/(wn*frac)
step(g)

%%
close all
clear 
clc

eq = [ 1 4 24.542];
roots(eq)
%%
close all
clear 
clc

g = inline('x^2 +4*x + 24.542');
g(-10)
245.42/(-10*g(-10))
%%
close all
clear 
clc

eq = [ 1 0.842 2.829];
roots(eq);
frac = 0.250
eq = 1.76*frac^3 - 0.417*frac^2 + 1.039*frac +1;
tr = eq
%%
close all
clear 
clc

Mp = 0.245;
lg = log(Mp);
frac = lg/(sqrt(pi^2 + lg^2))
w = 4 /(frac*2.62)
%%
close all
clear 
clc

eq = [ 1 3 10];
roots(eq)
%%
close all
clear
clc

eq = [1 0 5 0 10 0 12];
roots(eq)
%%
close all
clear
clc

eq1 = [1 0 10 0 169];
roots(eq1)
%%
close all
clear
clc

eq1 = [1 -2 2];
roots(eq1)

eq2 = [1 2 4];
roots(eq2)








