function G = CalcoloMatriceGramianaR(A,B)
    %calcolo della matrice gramiana di raggiungibilità
    syms s t tau;
    
    dim_A = size(A);
    A_trasp = A';
    B_trasp = B';
    n = dim_A(1);
    I = eye(n);
    
    %PASS1: CALCOLO DELLA MATRICE e^(A*tau)    
    mat1 = s*I;                         %matrice sI
    mat2 = mat1-A;                      %matrice sI-A
    mat3 = inv(mat2);                   %matrice (sI-A)^-1
    mat4 = ilaplace(mat3);              %matrice e^(At)
    mat_exp = subs(mat4,t,tau);         %matrice e^(A*tau)
    
    %PASSO2: CALCOLO DELLA MATRICE e^(A'*tau) 
    mat5 = mat1-A_trasp;                %matrice sI-A'
    mat6 = inv(mat5);                   %matrice (sI-A')^-1
    mat7 = ilaplace(mat6);              %matrice e^(A't)
    mat_exp_trasp = subs(mat7,t,tau);   %matrice e^(A'*tau)
    
    %PASSO3: CALCOLO DELL'ARGOMENTO DELL'INTEGRALE
    mat_f = (mat_exp*B)*(B_trasp*mat_exp_trasp);    %e^(A*tau)*B*B'*e^(A'*tau)
    
    %PASSO4: CALCOLO DELL'INTEGRALE
    G = int(mat_f,tau,0,t);
end