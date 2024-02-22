close all
clear
clc

s = tf('s');
ftma = 1/(s^2 + 2*s +2)
rltool(ftma)
close all
%%
close all
clear
clc

s = tf('s');
ftma = (120*(s+2))/((s+3)*(s+4));
ftmf = feedback(ftma, 1);
rltool(ftmf)
%lsim(5*ftmf)





















