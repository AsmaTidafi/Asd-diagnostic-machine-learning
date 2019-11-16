clear all;
%Lire le fichier des données
T = readtable('autism_data_preprocessed.csv', 'delimiter', ',');

%diviser les données train / test
n = floor(2*size(T,1)/3);

X = T{1:n,1:30};
X_test = T{n+1:size(T,1),1:30};

Y = T{1:n,31};
Y_test = T{n+1:size(T,1),31};
features = {'female' 'male' 'asian' 'black' 'hisp' 'latin' 'md_east ' 'Eothers' 'pasifik' 's_asian' 'turk' 'white_eu' 'hc_pro' 'Rothers' 'parent' 'relative' 'self' 'A1' 'A2' 'A3' 'A4' 'A5' 'A6' 'A7' 'A8' 'A9' 'A10' 'age' 'jaund' 'autism'};

%Construction de l'arbre de décision
M = fitctree(X, Y, 'PredictorNames',  features);
%Affichage de l'arbre de décision
view(M, 'Mode', 'graph')

%Afficher l'importance de chaque attribut
imp = predictorImportance(M);

%Afficher l'histogramme d'importance des attributs
figure;
b = bar(imp);

set(gca,'xticklabel',features);
XTick = 1:30;
set(gca,'xtick',XTick)
title('Features importance');
ylabel('Estimates');
xlabel('Features');

%Calculer les prédictions
Y_predicted = predict(M,X_test);

%Calculer la matrice de confusion
cm = confusionmat(Y_test,Y_predicted);
%Afficher la matrice de confusion
figure;
imagesc(cm);
title('Confusion Matrix');
ylabel('Target Class');
xlabel('Output Class');
%afficher les valeurs de la matrices de confusion
for a=1:2
    for b=1:2
        text(b,a,num2str(cm(a,b)))
    end
end
