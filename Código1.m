% Parámetros
A = 1;        % Amplitud de la señal ASK
T = 1;        % Periodo de la señal modulante
Fs = 1000;    % Frecuencia de muestreo
t = 0:1/Fs:10; % Vector de tiempo

% Generar señal modulante g(t) - Onda cuadrada para simular ASK
g_t = A * (square(2 * pi * t / T) + 1) / 2;

% Calcular la transformada de Fourier de g(t)
G_f = fft(g_t);            % FFT de la señal
n = length(g_t);           % Número de muestras
f = (-n/2:n/2-1)*(Fs/n);   % Vector de frecuencias centrado en cero

% Mover la FFT para que esté centrada en cero (frecuencia negativa y positiva)
G_f_shifted = fftshift(G_f);

% Graficar la transformada de Fourier completa (frecuencias positivas y negativas)
figure;
plot(f, abs(G_f_shifted))
title('Transformada de Fourier completa de la envolvente compleja g(t)')
xlabel('Frecuencia (Hz)')
ylabel('Amplitud')
grid on;
