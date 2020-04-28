function x = CalcoloRispostaForzata(A,B,u,T)
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
    
    syms s t;
    
    if T < 0
        fprintf("T deve essere maggiore di 0\n");
        return
    else
        dim_A = size(A);
        n = dim_A(1);       %dimensione della matrice A
        I = eye(n);         %matrice indentità di dimensione nxn
    
        %calcolo della matrice di transizione dello stato in s
        mat1 = s*I;
        mat2 = mat1-A;
        mat = inv(mat2);    %matrice di transizione dello stato (sI-A)^-1
        
        %calcolo della risposta forzata in s
        H = mat*B;          %matrice delle risposte forzate nello stato
        U = laplace(u);     
        Xf = H*U;           %risposta forzata nello stato in s
        xf = ilaplace(Xf);  %risposta forzara nello stato in t
        
        %calcolo della risposta forzata nel dominio del tempo, al tempo T
        %desiderato, applicando il controllo u0 desiderato
        x = subs(xf,t,T);

        %rappresentazione su un grafico della risposta forzata ottenuta
        %time = [0:1:T];    
        %vet = [];
        
        %for i = 0:T
        %    val = subs(xf,t,i);
        %    vet = horzcat(vet,val);
        %end
        
        %x1 = vet(1,:);
        %x2 = vet(2,:);
        %plot(time,x1,"r--*","LineWidth",2);
        %hold on
        %plot(time,x2,"g--*","LineWidth",2);
        %title("andamento della risposta forzata");
        %xlabel("tempo t");
        %ylabel("risposta forzata x");
        %legend("1°componente di x","2°componente di x");
    end  
end