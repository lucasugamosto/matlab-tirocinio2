function AndamentoJTc(A,B,u0,x,T,k)
    %rappresentazione sul grafico dell'andamenti dell'indice di costo J
    %associato al controllo ottimo calcolato precedentemente, al variare
    %del tempo T
    syms s tau t;
    
    if T<=0
        fprintf("il tempo T deve essere maggiore di 0\n");
        return
    elseif k<=0
        fprintf("il tempo k deve essere incluso nell'insieme dei tempi (0,T]\n");
        return
    elseif k>T
        fprintf("il tempo k deve essere incluso nell'insieme dei tempi (0,T]\n");
        return
    else
        %calcolo dell'indice di costo dei controlli ottimi calcolati al punto
        %precedente
        J = [];
        for i = 1:1:T
            u = TrovaControlloTc(A,B,x,i);      %calcolo del controllo uTi(.)
            u_trasp = u';
            arg = u*u_trasp;
            val = int(arg,tau,0,i);             %calcolo dell'indice di costo
            J = horzcat(J,val);
        end
    
        time = [1:1:T];
        plot(time,J,"g-*","Linewidth",2);
    
        %calcolo dell'indice di costo dell'ingresso u0(.) con il quale
        %calcolare la risposta forzata al punto 2
        
        u0_trasp = u0';
        arg_1 = u0*u0_trasp;
        Ju0 = int(arg_1,t,0,k);
        
        hold on
        plot(k,Ju0,"r*");
        
        title("andamento dell'indice di costo");
        xlabel("tempo t");
        ylabel("indice di costo J");
        legend("JTi(u*)","Jk(u0)");
end