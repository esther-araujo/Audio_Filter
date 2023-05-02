% A função profile permite monitorar o desempenho do código, gerando um relatorio
% sobre o tempo de execução de cada linha e da quantidade de vezes que cada linha é executada
% Também mostra o tempo de execução do programa geral
profile on;
clear;

% audioread: lê arquivo e retorna os dados de audio 
% e a frequencia de amostragem do sinal (em Hz)
% No caso do arquivo de entrada, Fs = 44,1 KHz
[f,Fs] = audioread('SinalRuidoso.wav');

% os dados do audio (y) são armazenados como uma matriz com linhas
% correspondentes aos quadros de audio e colunas correspondentes aos canais

% 8 segundos de audio
duration = length(f)/Fs;

% vetor de tempo
t = linspace(0, duration, length(f));
subplot(2,1,1);
plot(t, f); grid on;

xlabel('Time (seconds)');
ylabel('Amplitude');
title('Tempo');
axis([0 0.2 -10 10]);

N = size(f,1);
df = Fs / N;
w = (-(N/2):(N/2)-1) * df;
y = fft(f) / N; 
y2 = fftshift(y);

subplot(2,1,2);
plot(w, abs(y2)); grid on; 
title('Espectro de Frequencia')
xlabel('Frequency(Hz)')
ylabel('Amplitude');

% play do audio
%sound(y,Fs);

profile off;

T = profile ("info");
profshow (T);