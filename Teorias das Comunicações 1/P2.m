clear all
close all
clc
% Time vector
t = 0:0.01:1000; % Time vector from 0 to 1000 seconds with a step of 0.01 seconds

% Parameters
f0 = 1e6;  % Carrier frequency of 1 MHz
fm = 10e3; % Modulation frequency of 10 kHz

% Modulated signal
arg = 2*pi*f0*t + 2*sin(2*pi*fm*t);
y = 10*cos(arg);

% Compute FFT
N = length(y);                % Number of points
Fs = 1/0.01;                  % Sampling frequency (100 Hz in this case)
frequencies = Fs*(0:(N-1))/N; % Frequency vector

Y = fft(y)/N;                 % Compute FFT and normalize by N

% Plot frequency spectrum
figure;
plot(frequencies, abs(Y));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Frequency Spectrum');
grid on;
