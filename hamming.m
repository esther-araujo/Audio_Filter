function [hn] = hamming(wc, M)
    % =============== Cálculo do Filtro ====================
    n  = 0:M; % Vetor de tempo discreto.  
    hd = PB_ideal(wc,M); % Resposta ao impulso ideal;
    % Equação da janela
    wn = 0.54 - 0.46*cos((2*pi*n)/M);

    % Resposta impulsiva do filtro
    hn = hd.*wn;
end