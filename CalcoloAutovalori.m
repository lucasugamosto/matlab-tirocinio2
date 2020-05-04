function val = CalcoloAutovalori(A)
    %calcolo degli autovalori della matrice d'ingresso
    dim = size(A);
    if dim(1) ~= dim(2)
        fprintf("la matrice non � quadrata\n");
        return
    else
        val = eig(A);
    end
end