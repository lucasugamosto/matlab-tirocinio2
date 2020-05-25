  function u = TrovaControlloTc(A,B,xf,T)
    %calcolo del controllo u(.) tale che se x(0) = 0 allora x(T) = x_des.
    %Questa procedura permette di ottenere il controllo u(.) che minimizzi
    %l'indice di costo J(u)
    syms s t tau;
    
    if T<=0
        fprintf("il tempo T deve essere maggiore 0\n");
        return
    else
        %calcolo delle dimensioni delle matrici A e B
        dim_A = size(A);            %dim(A) = nxn
        dim_B = size(B);            %dim(B) = nxp
        n = dim_A(1);
        p = dim_B(2);
        I = eye(n);

        %creazione della matrice di raggiungibilità P(A,B)
        P = [];
        j = 0;
        for i = 1:n
            mat = (A^j)*B;
            P = horzcat(P,mat);
            j = j+1;
        end
    
        %controllo se lo stato xf è raggiungibile
        rank_P = rank(P);                   %rango della matrice P
        mat = horzcat(P,xf);                %matrice [P|xf]
        rank_mat = rank(mat);               %rango della matrice [P|xf]
    
        if rank_P~=rank_mat
            fprintf("lo stato desiderato non può essere raggiunto\n");
            return
        else
            %fprintf("lo stato desiderato può essere raggiunto\n");
        end
    
        %calcolo della funzione d'ingresso per raggiungere xf all'istante
        %t>0
        G = CalcoloMatriceGramianaR(A,B);   %matrice G(t)
        G_inv = pinv(G);                    %inversa di G(t)
        b = G_inv*xf;                       %vettore b: G(t)*b = xf
        
        mat1 = s*I;
        mat2 = mat1-A';                     %sI-A'
        mat3 = inv(mat2);                   %(sI-A')^-1
        mat_exp = ilaplace(mat3);           %e^(A't)
        
        mat4 = subs(mat_exp,t,-tau);        %e^(-A'tau)
        mat5 = mat_exp*mat4;                %e^(A'(t-tau))
    
        expr = B'*mat5*b;                   %B'e^(A'(t-tau))b
        u = subs(expr,t,T);
    end
end