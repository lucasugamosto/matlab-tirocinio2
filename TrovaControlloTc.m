  function u = TrovaControlloTc(A,B,xf,T)
    %calcolo del controllo u(.) tale che se x(0) = 0 allora x(T) = x_des.
    %Questa procedura permette di ottenere il controllo u(.) che minimizzi
    %l'indice di costo J(u)
    syms t tau;
    
    if T<0
        fprintf("il tempo T deve essere maggiore o uguale a 0\n");
        return
    else
        %calcolo delle dimensioni delle matrici A e B
        dim_A = size(A);
        dim_B = size(B);
        n = dim_A(1);
        p = dim_B(2);

        %creazione della matrice di raggiungibilità P(A,B)
        if n == 1
            P = B;
        elseif n == 2
            P = [B A*B];
        elseif n == 3
            P = [B A*B (A^2)*B];
        elseif n == 4
            P = [B A*B (A^2)*B (A^3)*B];
        elseif n == 5
            P = [B A*B (A^2)*B (A^3)*B (A^4)*B];
        elseif n == 6
            P = [B A*B (A^2)*B (A^3)*B (A^4)*B (A^5)*B];
        elseif n == 7
            P = [B A*B (A^2)*B (A^3)*B (A^4)*B (A^5)*B (A^6)*B];
        elseif n == 8
            P = [B A*B (A^2)*B (A^3)*B (A^4)*B (A^5)*B (A^6)*B (A^7)*B];
        elseif n == 9
            P = [B A*B (A^2)*B (A^3)*B (A^4)*B (A^5)*B (A^6)*B (A^7)*B (A^8)*B];
        elseif n == 10
            P = [B A*B (A^2)*B (A^3)*B (A^4)*B (A^5)*B (A^6)*B (A^7)*B (A^8)*B (A^9)*B];
        end
    
        %controllo se lo stato xf è raggiungibile
        rank_P = rank(P);            %rango della matrice P
        P_xf = horzcat(P,xf);        %matrice [P|xf]
        rank_P_xf = rank(P_xf);      %rango della matrice [P|xf]
    
        if rank_P~=rank_P_xf
            fprintf("lo stato desiderato non può essere raggiunto\n");
            return
        else
            fprintf("lo stato desiderato può essere raggiunto\n");
        end
    
        %procedura per il calcolo della funzione d'ingresso per raggiungere
        %xf all'istante T(T>0)
        G = CalcoloMatriceGramianaR(A,B);   %matrice gramiana
        G_inv = pinv(G);                    %inversa della matrice gramiana
        beta = G_inv*xf;                    %beta : G*beta = xf
    
        B_trasp = B';
        A_trasp = A';
        A1 = A_trasp*(t-tau);           %A'(t-tau)
        A2 = exp(A1);                   %e^A'(t-tau)
        u_t = B_trasp*A2*beta;          %B'e^A'(t-tau)beta
        u = subs(u_t,t,T);
    end
   
        %calcolo dell'indice di costo che si ha con il controllo u(.)  
        %u_trasp = u_t';
        %arg = u_t*u_trasp;
        %J = int(arg,tau,0,t);
        %J = subs(J,t,T)
        
end