close all
clear
clc
freq = 60; % Frequency of the sine wave
w = 2*pi*freq; % Angular frequency
t = 0:0.001:0.1; % Time vector

tensao = [27.53 54.17 80.13 104.30];
corrente = [50.28 100.49 150.46 198.79];

figure; % Create figure window
% Loop through all values of tensao and corrente
for i = 1:length(tensao)
    % Calculate the sine wave with amplitude of 20/sqrt(2)
    tensao_i = (tensao(i))*sin(w*t);
    corrente_i = (corrente(i))*sin(w*(t-73.3*pi/180));
    % Create subplot and plot the sine wave and intersection point
    subplot(length(tensao),1,i);
    plot(t, tensao_i, 'b');
    hold on;
    plot(t, corrente_i, 'r');
    plot([0 max(t)], [0 0], 'k');    
    xlabel('Tempo (s)');
    %ylabel('Tensão (V) & Corrente(mA)');
    title(['Gráfico tensão vs corrente com corrente atrasada em 73.3 graus (Tensão = ' num2str(tensao(i)) 'V)']);
    legend('Tensao (V)', 'Corrente (mA)');
    grid on;
end
