%%Questões do livro texto
%Questão 5.6

e0 = 8.854e-12;
mi0 = 4*pi*10^(-7);
sigma = 0.1;%S/m
er = 4;
mir = 600;
mi = mir * mi0;
e = er * e0;
frequencia = 1:100000:100e9;
log_frequencia = log(frequencia);
w = 2*pi*frequencia;
for k=1:1:length(frequencia)
    gamma(k) = sqrt(1i*w(k)*e*(sigma + 1i*w(k)*e));
    alfa(k) = real(gamma(k));
    beta(k) = imag(gamma(k));
    n(k) = (1i*w(k)*mi)/gamma(k);
end

plot(log_frequencia, w)
%%
%%Resposta do livro
clear all 
clc
% Initialize Variables 
uo=pi*4e-7; 
eo=8.854e-12; 
sig=0.10; 
er=4; 
ur=600; 
% Perform Calculation 
for i=1:10 
 for j=1:10 
 m=(i-1)*10+j; 
 f(m)=j*10^(i-1); 
 w(m)=2*pi*f(m); 
 A(m)=i*(w(m)*ur*uo); 
 B(m)=complex(sig,w(m)*er*eo); 
 gamma(m)=sqrt(A(m)*B(m)); 
 alpha(m)=real(gamma(m)); 
 beta(m)=imag(gamma(m)); 
 eta(m)=sqrt(A(m)/B(m)); 
 meta(m)=abs(eta(m)); 
 aeta(m)=180*angle(eta(m))/pi; 
 end 
end 
subplot(3,1,1) 
plot(f,alpha,'-o',f,beta,'-*') 
ylabel('1/m') 
xlabel('frequency (Hz)')
legend('alpha','beta') 
subplot(3,1,2) 
semilogx(f,meta) 
ylabel('magnitude of eta (ohms)') 
subplot(3,1,3) 
semilogx(f,aeta) 
ylabel('phase of eta (degrees)') 
xlabel('frequency (Hz)')