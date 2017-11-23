function Q1A
data = xlsread('Database.xlsx');

% Histogramme de la consommation de bière
histogram(data(:,2),0:20:400);
xlabel('Nombre de canettes consommees');
ylabel('Nombres de pays concernes');
title('Histogramme de la consommation de biere dans le monde');

figure
% Histogramme de la consommation d'alcool fort
histogram(data(:,3),0:20:450);
xlabel('Nombre de shots consommes');
ylabel('Nombres de pays concernes');
title('Histogramme de la consommation d alcool fort dans le monde');

end


