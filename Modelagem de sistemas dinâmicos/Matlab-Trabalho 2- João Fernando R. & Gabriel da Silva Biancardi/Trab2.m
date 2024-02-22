%%
%Para melhor compreensão do processo de estudo dos dados, siga os passos
%explicitos nos comentários
%o código está divido em seções, para executar cada seção tecle Ctrl+Enter
close all
clc
%Importe as variáveis no arquivo .csv presente na pasta do trabalho
%Em Output type, selecione Column vectors
%Na tela de importação dos dados substitua VarName1 por Freq, VarName2 por vin e Varname3 por vout
%%
%Nesta primeira seção são plotados os pontos experimentais
Ganho = vout./vin;%Cálcula ganho a partir das variáveis importadas
GanhodB = 20*log10(Ganho);%Conversão para dB
semilogx(2*pi*Freq, GanhodB);%Plota os valores de ganho em dB com eixo x em frequencia angular
grid on
ylim([-30, 10]);
hold on
%os próximos passos mostrarao de maneira ilustrativa o processo de encaixe
%das assíntotas
%%
%Cria-se uma variável que funcionará como eixo x para nossas funções
freq1 = 0.1:0.15:500;
%%
%Assíntota horizontal
x(1:length(freq1)) = 1.874;
semilogx(freq1,x);
%%
%Função teste, cada uma das seções abaixo é uma função que foi testada até
%que as linhas se encaixassem no gráfixo experimental
%Execute cada seção para ver a progressão dos desenhos no gráfico
y0 = -21*log10(freq1);
semilogx(freq1,y0);
%%
y1 = -20*log10(freq1)+5;
semilogx(freq1,y1);
%%
y2 = -20*log10(freq1)+20;
semilogx(freq1,y2);
%%
y3 = -20*log10(freq1)+40;
semilogx(freq1,y3);
%%
%Finalmente se encontrou a seguinte função
y4 = -21*log10(freq1)+30;
semilogx(freq1,y4);
%Com as retas determinadas, vamos limpar o gráfico para melhor análise
%%
%Plotando mais uma vez o código com as assíntotas
close all
clear x y0 y1 y2 y3 
semilogx(2*pi*Freq, GanhodB);
grid on
ylim([-30, 10]);
hold on
x(1:length(freq1)) = 1.874;
semilogx(freq1,x);
y4 = -21*log10(freq1)+30;
semilogx(freq1,y4);
%Clique no ponto de interseção das retas para encontrar o polo
%Para confirmar vamos aqui traçar uma reta que marca onde fica o ponto de
%-3dB do gráfico.
%%
ganho_menos_3 = GanhodB(1) - 3;
y5(1:length(freq1)) = (ganho_menos_3);
semilogx(freq1,y5);

%%
%Aqui vamos mais uma vez limpar o gráfico e comparar as respostas em
%frequencia das funções de transferência encontradas na parte 2 do roteiro.
%As contas para determinação dos ganhos dessas funções podem ser
%encontradas no relatório
close all
clear x y0 y1 y2 y3 y4 y5
semilogx(2*pi*Freq, GanhodB);
grid on
hold on
s = tf('s');
FT_assintotas = 27.48/(s+22.15);
Ft_menos3db = (22.9141)/(s+20.35);
Ft_teorica = 468.6/(s+21.47);%Função fornecida pelo roteiro
bodemag(FT_assintotas, 'r', Ft_menos3db, 'g', Ft_teorica, 'm');
grid on
legend('Dados experimentais', 'Método das assíntotas', 'A partir do ponto de -3dB','Função teórica fornecida', 'Location', 'southwest');
%%
%Aqui são plotadas as funções com o ganho proporcional determinado pela
%análise no simulink. 
close all
clear x y0 y1 y2 y3 y4 y5
semilogx(2*pi*Freq, GanhodB);
grid on
hold on
s = tf('s');
FT_assintotas = (16.57*27.48)/(s+22.15);
Ft_menos3db = (16.3*22.9141)/(s+20.35);
Ft_teorica = 468.6/(s+21.47);%Função fornecida pelo roteiro
bodemag(FT_assintotas, 'r', Ft_menos3db, 'g', Ft_teorica, 'm');
grid on
legend('Dados experimentais', 'Método das assíntotas', 'A partir do ponto de -3dB','Função teórica fornecida', 'Location', 'southwest');



%%
%Aqui todas as curvas com ganho proporcional são comparadas.
close all
semilogx(2*pi*Freq, GanhodB);
grid on
hold on
ganho_menos3dB = 16.3;
ganho_assintotas = 16.57;
Ft_menos3db_com_ganho = (ganho_menos3dB*24.7156)/(s+19.6);
FT_assintotas_com_ganho =(ganho_assintotas*27.48)/(s+22.15); 
Ft_resposta_degrau = 380.53/(s+18.158);
bodemag(Ft_menos3db_com_ganho, 'g', Ft_teorica, 'm', Ft_resposta_degrau, 'r', FT_assintotas_com_ganho, 'b');
grid on
legend('Dados experimentais','A partir do ponto de -3dB','Função teórica fornecida','Função a partir do degrau','Assintotas com ganho', 'Location', 'southwest');
%Aqui se encerra o código de matlab utilizado para análise da resposta em
%frequência.




