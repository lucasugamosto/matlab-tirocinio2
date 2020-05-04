function x = CalcoloRispostaForzata(A,B,u0,T)
    %NOTA:
    %Se si volesse inserire un controllo u(.) costante nel tempo allora si
    %deve specificare la funzione gradino poichè tale controllo vale per t
    %maggiore o uguale a 0 (heaviside(t)).
    %Nel caso si volesse inserire un controllo u(.) non costante, con la
    %variabile t di qualsiasi grado, la funzione "heaviside(t)" può essere
    %omessa poichè è sottointesa.

    %Per il calcolo della risposta forzata si opera nel dominio di Laplace
    %poichè lavorare in quello del tempo è più complesso. Alla fine viene
    %riportata la soluzione nel dominio del tempo.
    
    syms s t tau;
    
    if T < 0
        fprintf("T deve essere maggiore di 0\n");
        return
    else
        dim_A = size(A);
        n = dim_A(1);           %n = n° di righe e di colonne di A
        I = eye(n);             %matrice indentità di dimensione nxn
    
        %calcolo della matrice di transizione dello stato in s
        mat1 = s*I;             %matrice sI
        mat2 = mat1-A;          %matrice sI-A
        mat = inv(mat2);        %matrice (sI-A)^-1
        
        %calcolo della risposta forzata in s
        H = mat*B;              %matrice (sI-A)^-1*B
        U = laplace(u0);        %L{u0(t)} = u(s)
        Xf = H*U;               %risposta forzata nel dominio di Laplace
        xf = ilaplace(Xf);      %risposta forzara nel dominio del tempo
        
        %calcolo della risposta forzata al tempo T desiderato (T>= 0)
        x = subs(xf,t,T);       %xf(T)
    end  
end