clear all
close all
clc

s = tf('s');
ftma = 10/(s*(s+2));
step(feedback(ftma,1))
grid on
cav = 2.66*(s+3.26)/(s+11.26);
fcav = ftma*cav;
%%
hold on
step(feedback(fcav,1));

%%
clear all
close all
clc

s = tf('s');
ftma = 1/(s*(s+2));
step(feedback(ftma,1))
grid on
cav = 2.72*(s+1.6)/(s+2.66);
fcav = ftma*cav;
%%
hold on 
step(feedback(fcav,1));



