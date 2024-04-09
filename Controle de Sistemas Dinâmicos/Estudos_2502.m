clear 
close all
clc

ksi = tf('s');
t = 10/(ksi^5 + 2*ksi^4 +3*ksi^3 +6*ksi^2+5*ksi+3);
%rlocus(t)
d = 10/(3*ksi^5+5*ksi^4+6*ksi^3+3*ksi^2+2*ksi+1);
rlocus(d)
%%
clear 
close all
clc
x = -2:0.1:2;
k = 0:0.05:5;

for i=1:length(x)
y = x.^2+15*x+(50+k(i));
plot(x,y)
grid on
hold on
end
%%
clear 
close all
clc
y = [1 2 4];
roots(y)
%%







