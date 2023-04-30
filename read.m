% audioread: lê arquivo e retorna os dados de audio 
% e a frequencia de amostragem do sinal (em Hz)
% No caso do arquivo de entrada, Fs = 44,1 KHz
[y,Fs] = audioread('SinalRuidoso.wav');

% os dados do audio (y) são armazenados como uma matriz com linhas
% correspondentes aos quadros de audio e colunas correspondentes aos canais

% play do audio
sound(y,Fs);

