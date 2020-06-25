%m-file contenente i valori dei parametri u0,tseg,T,gamma1,gamma2.
%Quest'ultimi due valori relativi al caso di:
%DUE AUTOVALORI COMPLESSI CONIUGATI.
syms t

gamma1 = -2;
gamma2 = -2;

A = [0 1;gamma1 gamma2];
fprintf("autovalori della matrice A sono:\n");
eig(A)

B = [0;1];

u0 = 10*t+5;
tseg = 4;
T = 8;