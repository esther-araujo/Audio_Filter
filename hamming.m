function [hn, tipo, M] = hamming(wc, Bw)
    N  = ceil(3.3/Bw);   % Comprimento da janela
    M  = N-1;              % Ordem do Filtro;
    tipo = 'Hamming';
    % =============== Cálculo do Filtro ====================
    n  = 0:M; % Vetor de tempo discreto.  
    hd = PB_ideal(wc,M); % Resposta ao impulso ideal;
    % Equação da janela
    wn = 0.54 - 0.46*cos((2*pi*n)/M);

    % Resposta impulsiva do filtro
    hn = hd.*wn;
end