function [meanOfAll, data100Ech, DistKS] = Q2b()


importData;

echantillons = zeros(20,4,100);
median_beer_100 = zeros(100,1);
median_spirit_100 = zeros(100,1);
mean_beer_100 = zeros(100,1);
mean_spirit_100 = zeros(100,1);
std_beer_100 = zeros(100,1);
std_spirit_100 = zeros(100,1);
KS_beer_100  = zeros(100,1);
KS_spirit_100  = zeros(100,1);

KS_wine_100  = zeros(100,1);
KS_pure_100  = zeros(100,1);

% On prend 100 echantillons de 20 pays au hasard
for j = 1:100
    index_echantillon = randsample(100,20,false);
    for i = 1:20
        echantillons(i,1:4,j) = dataset(index_echantillon(i),:);
    end
    

    beer_data = echantillons(:,1,j);
    spirit_data = echantillons(:,2,j);
    wine_data = echantillons(:,3,j);
    pure_data = echantillons(:,4,j);
    
    
    % Calcul de la mediane pour la consommation de biere et d'alcool fort
    %pour chaque echantillon
    median_beer_100(j) = median(beer_data);
    median_spirit_100(j) = median(spirit_data);

    % Calcul de la moyenne pour la consommation de biere et d'alcool fort
    %pour chaque echantillon

    mean_beer_100(j) = mean(beer_data);
    mean_spirit_100(j) = mean(spirit_data);

    % Calcul de l'ecart-type pour la consommation de biere et d'alcool fort
    %pour chaque echantillon

    std_beer_100(j) = std(beer_data);
    std_spirit_100(j) = std(spirit_data);
    
    

    % Calcul de la distance de Kolmogorov-Smirnov entre la population et
    % l echantillon pour toutes les boissons
    [~,~,KS_beer] = kstest2(beer_data,(dataset(:,1)));
    KS_beer_100(j) = KS_beer;
    [~,~,KS_spirit] = kstest2(spirit_data,(dataset(:,2)));
    KS_spirit_100(j) = KS_spirit;
    
    [~,~,KS_wine] = kstest2(wine_data,(dataset(:,3)));
    KS_wine_100(j) = KS_wine;
    [~,~,KS_pure] = kstest2(pure_data,(dataset(:,4)));
    KS_pure_100(j) = KS_pure;

end

%Histogrammes
figure
histogram(median_beer_100,0:10:400);
title({'Histogramme de la repartition des medianes de la ';'consommation de bieres sur 100 echantillons'});
ylabel("Nombres de medianes");
xlabel("Nombres de canettes");

figure
histogram(median_spirit_100,0:10:450);
title({'Histogramme de la repartition des medianes de la ';'consommation d alcool fort sur 100 echantillons'});
ylabel("Nombres de medianes");
xlabel("Nombres de shots");

figure
histogram(mean_beer_100,0:10:400);
title({'Histogramme de la repartition des moyennes de la ';'consommation de bieres sur 100 echantillons'});
ylabel("Nombres de medianes");
xlabel("Nombres de canettes");
figure
histogram(mean_spirit_100,0:10:450);
title({'Histogramme de la repartition des moyennes de la ';'consommation d alcool fort sur 100 echantillons'});
ylabel("Nombres de moyennes");
xlabel("Nombres de shots");

figure
histogram(std_beer_100,0:10:400);
title({'Histogramme de la repartition de l ecart-type de la ';'consommation de bieres sur 100 echantillons'});
ylabel("Nombres d ecart-type");
xlabel("Nombres de canettes");

figure
histogram(std_spirit_100,0:10:450);
title({'Histogramme de la repartition de l ecart-type de la ';'consommation d alcool fort sur 100 echantillons'});
ylabel("Nombres d ecart-type");
xlabel("Nombres de shots");



% Calcul de la moyenne de la mediane des echantillons
mean_median_beer = mean(median_beer_100);
mean_median_spirit = mean(median_spirit_100);

% Calcul de la moyenne de la moyenne des echantillons

mean_mean_beer = mean(mean_beer_100);
mean_mean_spirit = mean(mean_spirit_100);

% Calcul de la moyenne de l'ecart type des echantillons

mean_std_beer = mean(std_beer_100);
mean_std_spirit = mean(std_spirit_100);




figure
histogram(KS_beer_100,0:0.025:1)
title({'Histogramme de la repartition des distances de Kolmogorov-Smirnov';' de la consommation de bieres entre 100 echantillons et la population'});
ylabel('Nombre de distances de K-S');
xlabel('Distance de Kolmogorov-Smirnov');

figure
histogram(KS_spirit_100, 0:0.025:1)
title({'Histogramme de la repartition des distances de Kolmogorov-Smirnov';' de la consommation d alcool fort entre 100 echantillons et la population'});
ylabel('Nombre de distances de K-S');
xlabel('Distance de Kolmogorov-Smirnov');

figure
histogram(KS_wine_100, 0:0.025:1)
title({'Histogramme de la repartition des distances de Kolmogorov-Smirnov';' de la consommation de vin entre 100 echantillons et la population'});
ylabel('Nombre de distances de K-S');
xlabel('Distance de Kolmogorov-Smirnov');

figure
histogram(KS_pure_100, 0:0.025:1)
title({'Histogramme de la repartition des distances de Kolmogorov-Smirnov';' de la consommation d alcool pur entre 100 echantillons et la population'});
ylabel('Nombre de distances de K-S');
xlabel('Distance de Kolmogorov-Smirnov');

meanOfAll = [mean_median_beer,mean_median_spirit,mean_mean_beer,mean_mean_spirit,mean_std_beer,mean_std_spirit];
data100Ech = [median_beer_100,median_spirit_100,mean_beer_100,mean_spirit_100,std_beer_100,std_spirit_100];
DistKS = [KS_beer_100,KS_spirit_100,KS_wine_100,KS_pure_100];


end
