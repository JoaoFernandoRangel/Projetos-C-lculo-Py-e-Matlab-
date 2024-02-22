close all
tempo = 0:0.01:70;
a = 10;
degrau = zeros(size(tempo));
exponencial1 = zeros(size(tempo));
exponencial2 = zeros(size(tempo));
for i = 1:length(tempo)
    if tempo(i) < 10
        degrau(i) = 0;
        exponencial1(i) = 0;
    elseif tempo(i) > 40
        degrau(i) = 0;
        exponencial2(i) = -10*a^(-0.1*(tempo(i)-40));
    else
        degrau(i) = 10;
        exponencial1(i) = 100*a^(-0.1*tempo(i));
    end
end

% create first subplot for the step function
subplot(2,1,1);
plot(tempo, degrau);
ylabel('Tensão DC aplicada');
ylim([-2 12]); % set y-axis limits
title('Golpe indutivo');

% create second subplot for the exponential functions
subplot(2,1,2);
plot(tempo, exponencial1,'b');
ylim([-11 11]); % set y-axis limits
hold on;
plot(tempo, exponencial2,'b');
ylim([-11 11]); % set y-axis limits
xlabel('Time (s)');
ylabel('Valor de tensão hipotético');
title('Resposta a tensão DC aplicada');
