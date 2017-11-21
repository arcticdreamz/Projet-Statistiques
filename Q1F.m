function [cc_beer, cc_wine, cc_spirit] = Q1F()
data = xlsread('Database.xlsx');

% Scatterplot comparant la consommation d'alcool pur à la consommation de bière
scatter(data(:,4), data(:,1));
xlabel('Consommation d alcool pur (en L)');
ylabel('Consommation de biere (en canettes)');
title('\fontsize{9}Scatterplot comparant la consommation d alcool pur a la consommation de biere');

% Scatterplot comparant la consommation d'alcool pur à la consommation de vin
figure
scatter(data(:,4), data(:,3));
xlabel('Consommation d alcool pur (en L)');
ylabel('Consommation de vin (en verres)');
title('\fontsize{9}Scatterplot comparant la consommation d alcool pur a la consommation de vin');

% Scatterplot comparant la consommation d'alcool pur à la consommation d alcool fort
figure
scatter(data(:,4), data(:,2));
xlabel('Consommation d alcool pur (en L)');
ylabel('Consommation d alcool fort (en shots)');
title('\fontsize{9}Scatterplot comparant la consommation d alcool pur a la consommation d alcool fort');

% Calcul des coefficients de correlation avec la consommation d'alcool pur
cc_beer_matrix = corrcoef(data(:,4), data(:,1));
cc_wine_matrix = corrcoef(data(:,4), data(:,3));
cc_spirit_matrix = corrcoef(data(:,4), data(:,2));

cc_beer = cc_beer_matrix(2,1);
cc_wine = cc_wine_matrix(2,1);
cc_spirit = cc_spirit_matrix(2,1);

end

