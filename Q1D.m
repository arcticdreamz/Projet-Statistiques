function [quartile_beer, quartile_spirit] = Q1D()
data = xlsread('Database.xlsx');

% Affichage des boites à moustaches
boxplot(data(:,1));
title('Boxplot de la consommation de biere');

figure
boxplot(data(:,2));
title('Boxplot des consommation d alcool fort');

% Calcul des quartiles
quartile_beer = quantile(data(:,1), [0.25 0.50 0.75])
quartile_spirit = quantile(data(:,2), [0.25 0.50 0.75]);

end

