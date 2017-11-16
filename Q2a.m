importData;

% On prend 20 echantillons au hasard
index_echantillon = randsample(100,20,false);
echantillons = zeros(20,4);
for i = 1:20
    echantillons(i,1:4) = dataset(index_echantillon(i),:);
end

% Calcul de la mediane pour la consommation de biere et d'alcool fort
median_beer = median(echantillons(:,1));
median_spirit = median(echantillons(:,2));

% Calcul de la moyenne pour la consommation de biere et d'alcool fort

mean_beer = mean(echantillons(:,1))
mean_spirit = mean(echantillons(:,2))

% Calcul de l'ecart-type pour la consommation de biere et d'alcool fort
std_all = std(echantillons);
std_beer = std_all(1);
std_spirit = std_all(2);

figure
boxplot(echantillons(:,1));
title("Consommation de biere au monde d'un echantillon de 20");


figure
boxplot(echantillons(:,2));
title("Consommation de spiritueux au monde d'un echantillon de 20");



figure
cdfplot(echantillons(:,1));
title("Frequence cumulee de la consommation de biere au monde d'un echantillon de 20");

figure
cdfplot(echantillons(:,2));
title("Frequence cumulee de la consommation de spiritueux au monde d'un echantillon de 20");

KS_beer = kstest(echantillons(:,1))
KS_spirit = kstest(echantillons(:,2))

