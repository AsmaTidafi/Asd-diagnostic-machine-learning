clear ; close all; clc
%Lire la table des données (excel)
T = readtable('autism_data_preprocessed.csv', 'delimiter', ',');

%diviser les données (2/3 pour le training et 1/3 pour les test)
n = floor(2*size(T,1)/3);

X = T{1:n,1:30};
X_test = T{n+1:size(T,1),1:30};

Y = T{1:n,31};
Y_test = T{n+1:size(T,1),31};

%ajouter une colonne remplie de valeur 1 aux données d'entrée pour teta0
X = [ones(size(X,1), 1) X];
X_test = [ones(size(X_test,1), 1) X_test];

%initialiser les tetas à 0
initial_theta = zeros(size(X,2), 1);

%définir le nombre d'itérations
iter = 100;

lambda = 0.1;
%lancer le gradient descent pour calculer les nouvelles valeurs de teta
theta = gradientDescentRegularized_Team4(X, Y, initial_theta, 2, iter, lambda);

%utiliser le data du test pour prédire des résultats
Y_predicted = predict_Team4(theta,X_test);

%Calculer la matrice de confusion pour tester si les résultats prédits sont corrects
cm = confusionmat(Y_test,Y_predicted);

%Afficher la matrice de confusion
figure;
imagesc(cm);
title('Confusion Matrix');
ylabel('Target Class');
xlabel('Output Class');
for a=1:2
    for b=1:2
        text(b,a,num2str(cm(a,b)))
    end
end