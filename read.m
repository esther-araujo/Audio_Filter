% A função profile permite monitorar o desempenho do código, gerando um relatorio
% sobre o tempo de execução de cada linha e da quantidade de vezes que cada linha é executada
% Também mostra o tempo de execução do programa geral
profile on;

% audioread: lê arquivo e retorna os dados de audio 
% e a frequencia de amostragem do sinal (em Hz)
% No caso do arquivo de entrada, Fs = 44,1 KHz
[y,Fs] = audioread('SinalRuidoso.wav');

% os dados do audio (y) são armazenados como uma matriz com linhas
% correspondentes aos quadros de audio e colunas correspondentes aos canais

% play do audio
%sound(y,Fs);

profile off;
profile resume;

T = profile ("info");
profshow (T);