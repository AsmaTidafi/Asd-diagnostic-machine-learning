function p = predict_Team4(theta,X)
    %prédire les données en fonction des paramètres obtenus (hypothèse)
    p = zeros(size(X,1),1);
    for i = 1 : size(X,1)
        p(i) = X(i,:) * theta;
        %si la valeur de sortie est > 0.5 => X appartient à la classe 1
        if p(i) > 0.5
            p(i) = 1;
        else
            %sinon => X appartient à la classe 1
            p(i) = 0;
        end
    end
end