%O código abaixo foi elaborado durante a resolução do exercício e os
%cálculos estão justificados nos comentários ao lado. Junto ao pdf também
%estão fotos do caderno com as anotações que foram feitas em paralelo ao
%código.


clear all
clc


polos = [2 4];
ns(1) = 120*60/polos(1); % 3600
ns(2) = 120*60/polos(2);% 1800
carga = 150; %N.m
acoplamento = 2;
temperatura = 45;
altura = 2000;


cr = carga/(acoplamento*9.8);
graus = temperatura - 40;
altitude = (altura - 1000)/100;
kt = 1-(graus*0.02);%5graus * 0,02 = 0.1
ka = 1-(altitude*0.01);%1000 metros * 0,01 = 0.1
rendimento_de_acoplamento = 0.95;
f_fn_2_polos = [300/ns(1) 1100/ns(1)];
f_fn_4_polos = [300/ns(2) 1100/ns(2)];
%a partir dos valores de f/fn a tabela foi verificada e os valores de tr
%estao abaixo
tr_2polos(1) = f_fn_2_polos(1) + 0.5; % valor mais baixo
tr_2polos(2) = f_fn_2_polos(2)*0.4 + 0.65; %valor mais baixo
c_2polos(1) = cr/(kt*ka*rendimento_de_acoplamento*tr_2polos(1));
c_2polos(2) = cr/(kt*ka*rendimento_de_acoplamento*tr_2polos(2));
tr_4polos(1) = f_fn_4_polos(1) + 0.5; % valor mais baixo
tr_4polos(2) = f_fn_4_polos(2)*0.3 + 0.7; %valor mais baixo
c_4polos(1) = cr/(kt*ka*rendimento_de_acoplamento*tr_4polos(1));
c_4polos(2) = cr/(kt*ka*rendimento_de_acoplamento*tr_4polos(2));
c_4polos
c_2polos
% oc_4polos =
%
%   14.9182   11.2591
%
%
%c_2polos =
%
%   17.0494   12.8791
%
%Os valores de conjugado permitem escolher o motor de acordo com os cvs
%necessários
%2 polos - 100cv
%4 polos - 40cv
%A rede tem alimentação de 380V e os inversores são catalogados para tensão
%de alimentação de 220V portanto a corrente nominal deve ser corrigida

corrente_nominal_2polos = 231; %Ampéres
tensao_rede = 380;
tensao_catalogo = 220;
nova_corrente = (tensao_catalogo/tensao_rede)*corrente_nominal_2polos

%nova_corrente = 133.7368

%Com os valores de corrente e de alimentação da rede foi possível então
%determinar que o inversor correto para o motor de 2 polos é o modelo
%0142 T3848 PS



