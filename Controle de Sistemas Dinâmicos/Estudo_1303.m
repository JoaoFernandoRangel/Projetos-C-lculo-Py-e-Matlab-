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
%%
clear all
close all
clc

s = tf('s');
ftma = 16/(s*(s+4));
step(feedback(ftma,1))
grid on
cat = (s+0.2)/(s+0.04);
fcav = ftma*cat;
%%
hold on 
step(feedback(fcav,1));
%%
clear all
close all
clc

s = tf('s');
ftma = 200/(s*(s+10)*(s+20));
step(feedback(ftma,1))
grid on
cav = 8.323*(s+10)/(s+13.57);
cat = 1*(s+0.4)/(s+0.12);
fc = cat*cav*ftma;
%%
hold on 
step(feedback(fc,1));
%%
clear all
close all
clc
(1710442754902 - 17104483680232)/1000

