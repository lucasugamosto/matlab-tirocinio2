# matlab-tirocinio2
secondo tirocinio di TdS

1)"CalcoloAutovalori(A)" restituisce gli autovalori della matrice quadrata A, quindi in essa vi è un controllo per vedere se la matrice è quadrata;

2)"CalcoloMatriceGramianaR"(A,B)" restituisce la matrie gramiana di raggiungibilità (o osservabilità) nel dominio del tempo;

3)"CalcoloRispostaForzata(A,B,u,T)" restituisce la risposta forzata del sistema al tempo T, a seconda dell'ingresso di controllo u(.) che viene scelto di applicare al sistema. E' presente un controllo sulla variabile T poichè deve essere maggiore o uguale a 0 ma non minore. Inoltre vi è anche rappresentato l'andamento della risposta forzata nel tempo che va da 0 a T;

4)"TrovaControllo(A,B,xf,T)" restituisce il segnale di controllo u(.) che permette a partire da x(0) = 0 di arrivare a x(T) = xf in T passi. Inizialmente vi è un controllo per vedere se lo stato xf è realmente raggiungibile dal sistema, se lo è si calcola il controllo e l'indice di costo a desso associato, che in tale caso è quello minimo.
