function h = hypothese_Team4(x, i, teta)
    %calculer la probabilit� que X appartient � la classe 1
    h = sigmoid_Team4(x(i,:) * teta);
end