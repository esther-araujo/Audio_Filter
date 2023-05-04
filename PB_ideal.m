function hd = PB_ideal(wc,M)

%  Filtro passa baixa ideal
% ----------------------------
% [hd] = PB_ideal(wc,M)
% hd = resposta ao impulso ideal entre 0 e M
% wc = frequencia de corte em radianos
% M  = Ordem do Filtro
alpha = M/2;
n     = [0:M];
m     = n-alpha+eps;  % eps = numero muito pequeno para evitar divisao por 0
hd    = sin(wc*m)./(pi*m);