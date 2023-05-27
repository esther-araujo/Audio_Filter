function [hn, tipo, M] = blackman(wc, Bw)
    N  = ceil(5.5/Bw);   % Comprimento da janela
    M  = N-1;              % Ordem do Filtro;
    tipo = 'Blackman';
    % =============== Cálculo do Filtro ====================
    n  = 0:M; % Vetor de tempo discreto.  
    hd = PB_ideal(wc,M); % Resposta ao impulso ideal;
    % Equação da janela
    wn = 0.42 - 0.5*cos((2*pi*n)/M) + 0.08*cos((4*pi*n)/M);

    % Resposta impulsiva do filtro
    hn = hd.*wn;
    figure('name','Resposta Impulsiva do Filtro - Blackman');
    plot(n, hn); grid on;
end