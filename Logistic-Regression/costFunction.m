function j = costFunction_Team4(x, y, teta)
    %définir la fonction d'erreur J
    %le but est de minimiser la valeur de teta
    m = size(x,1);
    somme = 0;
    %calculer l'erreur
    %si y = 1 => cost = -log(h(x))
    %si y = 0 => -log(1- h(x))
    for i = 1 : m
        somme = somme + y(i) * log(hypothese_Team4(x,i,teta)) + (1 - y(i)) * log(1 - hypothese_Team4(x,i,teta));
    end
    j = -(1/m) * somme;
end