function h = hypothese_Team4(x, i, teta)
    %calculer la probabilité que X appartient à la classe 1
    h = sigmoid_Team4(x(i,:) * teta);
end