function teta = gradientDescent_Team4(x, y, teta, alpha, iter)
    %Répéter la formule jusqu’à la convergence afin de minimiser la valeur du Cost
    m = size(x,1);
    %initialiser le vecteur qui va contenir les valeurs de cost à chaque itération
    vect_cost = zeros(size(iter,1));
    for k = 1 : iter
        for i = 1 : size(x,2)
            derivteta = 0;
            for j = 1 : m
                derivteta = derivteta + (hypothese_Team4(x, j, teta) - y(j))*x(j,i);
            end
            %calculer la nouvelle valeur de teta
            teta(i,1) = teta(i,1) - (alpha/m)*derivteta;
        end
        %calculer la nouvelle valeur de cost avec les tetas de l'itération k
        vect_cost(k) = costFunction_Team4(x,y,teta);
    end
    %afficher la courbe de variation du cost
    plot(vect_cost);
    xlabel('Iterations');
    ylabel('Cost');
    hold on
end