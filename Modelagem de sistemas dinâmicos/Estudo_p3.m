close all
clear
clc

s = tf('s');
ftma = 1/(((s+1)^3)*(s+4));
ftmf = feedback(ftma, 1);
rltool(ftma)
%%
close all
clear
clc

s = tf('s');
ftma = ((s+1)*(s+3)*(s+5))/((s+2)*(s+4)*(s+6));
ftmf = feedback(ftma, 1);
rltool(ftma)
%%
close all
clear
clc

s = tf('s');
ftma = 1/(s*(s+2)*(s^2+2*s+2));
ftmf = feedback(ftma, 1);
rltool(ftma)
%%
close all
clear
clc

s = tf('s');
ftma = 1/(s*(s+8));
ftmf = feedback(ftma, 1);
rltool(ftma)
%%
close all
clear
clc

s = tf('s');
ftma = 1/((s+4)*(s^2+2));
ftmf = feedback(ftma, 1);
rltool(ftma)

