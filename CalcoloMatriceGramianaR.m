function G = CalcoloMatriceGramianaR(A,B)
    %calcolo della matrice gramiana di raggiungibilità
    dim_A = size(A);
    A_trasp = A';
    B_trasp = B';
    n = dim_A(1);
    I = eye(n);
    syms s;
    syms t;
    
    %PASS1: CALCOLO DELLA MATRICE ESPONENZIALE e^(At)    
    mat1 = s*I;
    mat2 = mat1-A;
    mat3 = inv(mat2);
    mat_exp = ilaplace(mat3);
    
    %PASSO2: CALCOLO DELLA MATRICE ESPONENZIALE e^(A't) 
    mat4 = mat1-A_trasp;
    mat5 = inv(mat4);
    mat_exp_trasp = ilaplace(mat5);
    
    %PASSO3: CALCOLO DELL'ARGOMENTO DELL'INTEGRALE
    mat_f = mat_exp*B*B_trasp*mat_exp_trasp;
    
    %PASSO4: CALCOLO DELL'INTEGRALE
    G = int(mat_f,t,0,t);
end