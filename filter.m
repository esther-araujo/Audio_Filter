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
subplot(3,1,1);
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

subplot(3,1,2);
plot(w, abs(y2)); grid on; 
title('Espectro de Frequencia - Sinal Ruidoso')
xlabel('Frequency(Hz)')
ylabel('Amplitude');

% play do audio
%sound(y,Fs);

%Filtro
fbp = 2100; % limite banda passante
fbt = 3700; % limite da banda de transição
ft = fbt - fbp; % faixa de transição
fc = (fbt + fbp) /2; %freq de corte

% Janela
wt = (2*pi*fbt)/Fs; % Transição em rads
wp = (2*pi*fbp)/Fs; % Passagem em rads
wc = (wt+wp)/2; % Corte em rads
Bw = abs((wt - wp))/(2*pi); % Lóbulo principal
N  = ceil(3.3/(Bw));   % Comprimento da janela
M  = N-1;              % Ordem do Filtro;

h = hamming(wc, M);
yFiltrado = conv(f, h);
sound(yFiltrado, Fs);
n = size(yFiltrado,1);
df = Fs / n;
w2 = (-(n/2):(n/2)-1) * df;
Y = fft(yFiltrado) / N; 
Yfreq = fftshift(Y);
subplot(3,1,3);
plot(w2, abs(Yfreq)); grid on; 
title('Espectro de Frequencia - Sinal pós filtragem')
xlabel('Frequency(Hz)')
ylabel('Amplitude');

profile off;

T = profile ("info");
profshow (T);