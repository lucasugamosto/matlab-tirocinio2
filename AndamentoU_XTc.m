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

    u = TrovaControlloTc(A,B,xf,T);
    
    %ANDAMENTO DI u*(.) ESPRESSA NELL'INTERVALLO [0,T)
    control = [];
    for j = 0:1:T
        if j~=T
            val = subs(u,tau,j);
            control = horzcat(control,val);
        else
            control = horzcat(control,0);
        end
    end 
    
    %ANDAMENTO DI x*(.) ESPRESSA NELL'INTERVALLO [0,T]
    x = [];
    for i = 0:1:T
        val = CalcoloRispostaForzata(A,B,u,i);
        x = horzcat(x,val);
    end
    x1 = x(1,:);
    x2 = x(2,:);
    
    %RAPPRESENTAZIONE DEGLI ANDAMENTI DI u* e x* in un grafico
    plot(time,control,"b-o","Linewidth",2.5);
    hold on
    plot(time,x1,"r-o","Linewidth",2.5);
    hold on
    plot(time,x2,"g-o","Linewidth",2.5);
    title("andamento di u*(.) e x*(.)");
    xlabel("tempo t");
    legend("u*(.)","1° componente x*(.)","2° componente x*(.)");
end