# matlab-tirocinio2
secondo tirocinio di TdS

1)"CalcoloAutovalori(A)" restituisce gli autovalori della matrice quadrata A, quindi in essa vi è un controllo per vedere se la matrice è quadrata;

2)"CalcoloMatriceGramianaR"(A,B)" restituisce la matrie gramiana di raggiungibilità (o osservabilità) nel dominio del tempo;

3)"CalcoloRispostaForzata(A,B,u,T)" restituisce la risposta forzata del sistema al tempo T, a seconda dell'ingresso di controllo u(.) che viene scelto di applicare al sistema. E' presente un controllo sulla variabile T poichè deve essere maggiore o uguale a 0 ma non minore. Inoltre vi è anche rappresentato l'andamento della risposta forzata nel tempo che va da 0 a T;

4)"TrovaControllo(A,B,xf,T)" restituisce il segnale di controllo u(.) che permette a partire da x(0) = 0 di arrivare a x(T) = xf in T passi. Inizialmente vi è un controllo per vedere se lo stato xf è realmente raggiungibile dal sistema, se lo è si calcola il controllo e l'indice di costo a desso associato, che in tale caso è quello minimo.

5)"AndamentoJTc(A,B,u0,x,T,k)" calcola il controllo ottimo u*(.) che serve per raggiungere lo stato finale x desiderato in T passi, con T che varia da 1 a T. In seguito calcola per ogni controllo ottimo l'indice di costo e questi valori vengono riportati su un grafico insieme all'indice di costodel controllo u0(.) che in k passi raggiunge un qualsiasi stato finale.

6)"AndamentoU_XTc(A,B,xf,T)" restituisce un grafico contenente l'andamento del controllo ottimo in ogni istante dell'intervallo [0,T) che permette di raggiungere lo stato finale xf. Inoltre viene anche riportato l'adamento dello stato a partire da 0 fino al tempo T dove assume il valore desiderato che è xf.
