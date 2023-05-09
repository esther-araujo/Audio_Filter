% A função profile permite monitorar o desempenho do código, gerando um relatorio
% sobre o tempo de execução de cada linha e da quantidade de vezes que cada linha é executada
% Também mostra o tempo de execução do programa geral
profile on;
clear;

% audioread: lê arquivo e retorna os dados de audio 
[in_audio,Fs] = audioread('SinalRuidoso.wav');
num_samp = round(Fs); % Number of samples in a sec
% Cortando meio segundo do início (remover estouro inicial do audio)
audiowrite('cut.wav',in_audio(num_samp:end),Fs)

% audioread: lê arquivo e retorna os dados de audio 
% e a frequencia de amostragem do sinal (em Hz)
% No caso do arquivo de entrada, Fs = 44,1 KHz
[f,Fs] = audioread('cut.wav');

% Play do audio
%sound(f, Fs);

% os dados do audio (y) são armazenados como uma matriz com linhas
% correspondentes aos quadros de audio e colunas correspondentes aos canais

duration = length(f)/Fs;

% vetor de tempo
t = linspace(0, duration - 0.05, length(f));
N = size(f,1);
df = Fs / N;
w = (-(N/2):(N/2)-1) * df;
y = fft(f) / N; 
y2 = fftshift(y);

%Filtro
fbp = 2100; % limite banda passante
fbr = 3700; % limite da banda de rejeição

% Janela
wr = (2*pi*fbr)/Fs; % Transição em rads
wp = (2*pi*fbp)/Fs; % Passagem em rads
wc = (wr+wp)/2; % Corte em rads
Bw = abs(wr - wp)/(2*pi); % Largura de transição normalizada
N  = ceil(3.3/Bw);   % Comprimento da janela
M  = N-1;              % Ordem do Filtro;

% Janelamento da resposta ideal do filtro - Resposta impulsiva do filtro projetado
h = hamming(wc, M);
yFiltrado = conv(h, f);
sound(yFiltrado, Fs);
n = size(yFiltrado,1);

profile off;
% Plotagens
subplot(4,1,1);
plot(t, f); grid on;

xlabel('Time (seconds)');
ylabel('Amplitude');
title('Tempo - Sinal Ruidoso');
axis([0 0.2 -2 2]);

tF = linspace(0, duration, length(yFiltrado));
subplot(4,1,2);
plot(tF, yFiltrado); grid on;
xlabel('Time (seconds)');
ylabel('Amplitude');
title('Tempo - Sinal Filtrado');
axis([0 2 -2 2]);

subplot(4,1,3);
plot(w, abs(y2)); grid on; 
title('Espectro de Frequencia - Sinal Ruidoso')
xlabel('Frequency(Hz)')
ylabel('Amplitude');

df = Fs / n;
w2 = (-(n/2):(n/2)-1) * df;
Y = fft(yFiltrado) / N; 
Yfreq = fftshift(Y);
subplot(4,1,4);
plot(w2, abs(Yfreq)); grid on; 
title('Espectro de Frequencia - Sinal pós filtragem')
xlabel('Frequency(Hz)')
ylabel('Amplitude');

T = profile ("info");
profshow (T);