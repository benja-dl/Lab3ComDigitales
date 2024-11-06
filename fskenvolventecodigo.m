f1 = 900; % Frecuencia para símbolo ’0’
f2 = 1100; % Frecuencia para símbolo ’1’
fs = 10000; % Frecuencia de muestreo en Hz
t = 0:1/fs:1-1/fs; % Vector de tiempo
f = (-fs/2:fs/2-1)/fs * fs; % Eje de frecuencias (espectro)

% Generación de datos binarios aleatorios
data = randi([0 1], 1, length(t));

% Envolvente compleja
g = exp(1j * 2 * pi * f1 * t) .* (data == 0) + exp(1j * 2 * pi * f2 * t) .* (data == 1);

% Transformada de Fourier
G = fftshift(fft(g)); % Transformada de Fourier de la señal

% Gráfico de la señal original y su transformada
figure;
subplot(2, 1, 1);
plot(t, real(g)); % Parte real de g(t)
title('Parte real de g(t)');
xlabel('Tiempo (s)');
ylabel('Amplitud');

subplot(2, 1, 2);
plot(f, abs(G)/length(G)); % Transformada de Fourier normalizada
title('Transformada de Fourier de g(t)');
xlabel('Frecuencia (Hz)');
ylabel('Amplitud');