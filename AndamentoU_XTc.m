function AndamentoU_XTc(A,B,xf,T)
    %con la funzione TrovaControlloTc, verifico se esiste un controllo u*(.)
    %che mi permette di raggiungere lo stato desiderato con la minima
    %energia possibile
    syms s tau t;
    
    dim_A = size(A);
    dim_B = size(B);
    p = dim_B(2);
    n = dim_A(1);
    time = [0:1:T];
    
    if n ~= 2
        fprintf("n deve avere dimensione 2\n");
        return
    end

    u = TrovaControlloTc(A,B,xf,T);
    
    %ANDAMENTO DI u*(.) ESPRESSA NELL'INTERVALLO [0,T)
    control = [];
    for j = 0:1:T-1
        val = subs(u,tau,j);
        control = horzcat(control,val);
    end 
    control = horzcat(control,0);

    plot(time,control,"b-*","Linewidth",2);
    
    %ANDAMENTO DI x*(.) ESPRESSA NELL'INTERVALLO [0,T]
    mat1 = A*(t-tau);
    mat2 = exp(mat1);
    H = mat2*B;             %H(t-tau) = e^(A*(t-tau))*B
    
    expr = H*u;             %H(t-tau)*u(tau)
    
    x = [];
    for i = 0:1:T
        val = int(expr,tau,0,t);
        val = subs(val,t,i)
        x = horzcat(x,val);
    end
    
    x1 = x(1,:);
    x2 = x(2,:);
    
    title("andamento di u*(.) e x*(.)");
    xlabel("tempo t");
end