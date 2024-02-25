clear 
close all
clc

s = tf('s');
t = 10/(s^5 + 2*s^4 +3*s^3 +6*s^2+5*s+3);
%rlocus(t)
d = 10/(3*s^5+5*s^4+6*s^3+3*s^2+2*s+1);
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
clear 
close all
clc
 mp = 0.16;
 beta = log(mp);
 s = sqrt((beta^2)/(beta^2 + pi^2));
 s








