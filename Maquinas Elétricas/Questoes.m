clear all
clc
y = [1 -27.237 4.02];
roots(y)
x = 0.1484*1.5

%%
clear all
clc

cr = 7.65;
kt = 0.9;
ka=kt;
n = 0.95;
tr = [0.666 0.883];
cmax = cr/(kt*ka*n*tr(1))
cmin = cr/(kt*ka*n*tr(2))