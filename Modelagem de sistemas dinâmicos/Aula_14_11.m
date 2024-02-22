clear all
close all
clc

s = tf('s');
num = s+3;
den = s*(s+1)*(s+2);
ftma = num/den;
rltool(ftma)
%%
clear all
close all
clc

s = tf('s');
num = (s+3);
den = s*(s+1)*(s^2 +4*s +16);
ftma = num/den;
%rltool(ftma)
v = [-6 6 -6 6];
rlocus(ftma)
grid;
axis(v);axis('square')
%%
clear all
close all
clc


s = tf('s');
num = 1;
den = s*(s+0.5)*(s^2 +0.6*s +10);
ftma = num/den;
rlocus(ftma)
grid






