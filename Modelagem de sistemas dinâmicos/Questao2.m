clc
syms s
matriz = [s -1 0; 0 s -1; 0 2 s+3];
pretty(matriz)
x = inv(matriz);
g = [1 0 0];
y = g*x;
pretty(y)
z = [0;2;-5];
w = y*z;
pretty(w)