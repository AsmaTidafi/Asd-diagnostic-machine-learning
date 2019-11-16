function teta = gradientDescentRegularized_Team4(x, y, teta, alpha, iter, lambda)
    %Répéter la formule jusqu’à la convergence afin de minimiser la valeur du Cost
    m = size(x,1);
    %initialiser le vecteur qui va contenir les valeurs de cost à chaque itération
    vect_cost = zeros(size(iter,1));
    for k = 1 : iter
        derivteta = 0;
        for j = 1 : m
            derivteta = derivteta + (hypothese_Team4(x, j, teta) - y(j))*x(j,1);
        end
        teta(1,1) = teta(1,1) - (alpha/m)*derivteta;
        for i = 2 : size(x,2)
            derivteta = 0;
            for j = 1 : m
                derivteta = derivteta + (hypothese_Team4(x, j, teta) - y(j))*x(j,i);
            end
            %calculer la nouvelle valeur de teta
            teta(i,1) = teta(i,1) - (alpha/m)*(derivteta+lambda*teta(i,1));
        end
        %calculer la nouvelle valeur de cost avec les tetas de l'itération k
        vect_cost(k) = costFunctionRegularized_Team4(x,y,teta,lambda);
    end
    %afficher la courbe de variation du cost
    plot(vect_cost);
    xlabel('Iterations');
    ylabel('Cost');
    hold on
end