importData;


% On prend 1 echantillon de 20 pays au hasard
index_echantillon = randsample(100,20,false);
echantillon = zeros(20,4);
for i = 1:20
    echantillon(i,1:4) = dataset(index_echantillon(i),:);
end

beer_data = echantillon(:,1);
spirit_data = echantillon(:,2);
% Calcul de la mediane pour la consommation de biere et d'alcool fort
median_beer = median(beer_data);
median_spirit = median(spirit_data);

% Calcul de la moyenne pour la consommation de biere et d'alcool fort

mean_beer = mean(beer_data)
mean_spirit = mean(spirit_data)

% Calcul de l'ecart-type pour la consommation de biere et d'alcool fort

std_beer = std(beer_data);
std_spirit = std(spirit_data);

figure
boxplot(beer_data);
title("Consommation de biere au monde d'un echantillon de 20");


figure
boxplot(spirit_data);
title("Consommation de spiritueux au monde d'un echantillon de 20");



figure
cdfplot(beer_data);
title("Frequence cumulee de la consommation de biere au monde d'un echantillon de 20");

figure
cdfplot(spirit_data);
title("Frequence cumulee de la consommation de spiritueux au monde d'un echantillon de 20");

%[~,~,KS_beer] = kstest2(beer_data,population)
%[~,~,KS_spirit] = kstest2(spirit_data,population)

