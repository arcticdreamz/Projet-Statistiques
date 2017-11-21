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
    echantillon = zeros(20,4);
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
    
    [~,~,KS_beer] = kstest2(beer_data,(dataset(:,1)));
    KS_beer_100(j) = KS_beer
    [~,~,KS_spirit] = kstest2(spirit_data,(dataset(:,2)));
    KS_spirit_100(j) = KS_spirit
    
    [~,~,KS_wine] = kstest2(wine_data,(dataset(:,3)));
    KS_wine_100(j) = KS_wine
    [~,~,KS_pure] = kstest2(pure_data,(dataset(:,4)));
    KS_pure_100(j) = KS_pure


end

%Histogrammes
figure
median_biere_histogram = histogram(median_beer_100,20);
title("Median beer 100 echantillon");

figure
median_spirit_histogram = histogram(median_spirit_100,20);
title("Median spirit 100 echantillon");

figure
mean_biere_histogram = histogram(mean_beer_100,20);
title("Mean beer 100 echantillon");

figure
mean_spirit_histogram = histogram(mean_spirit_100,20);
title("Mean spirit 100 echantillon");

figure
std_biere_histogram = histogram(std_beer_100,20);
title("Std beer 100 echantillon");

figure
std_spirit_histogram = histogram(std_spirit_100,20);
title("Std spirit 100 echantillon");



% Calcul de la moyenne de la mediane des echantillons
mean_median_beer = mean(median_beer_100)
mean_median_spirit = mean(median_spirit_100)

% Calcul de la moyenne de la moyenne des echantillons

mean_mean_beer = mean(mean_beer_100);
mean_mean_spirit = mean(mean_spirit_100);

% Calcul de la moyenne de l'ecart type des echantillons

mean_std_beer = mean(std_beer_100);
mean_std_spirit = mean(std_spirit_100);


%Calcul de la distance de Kolmogorov

%[~,~,KS_beer] = kstest2(beer_data,population)
%[~,~,KS_spirit] = kstest2(spirit_data,population)


figure
histogram(KS_beer_100, 21)
title('Histogramme des distances de Kolmogrorov pour la bière')
ylabel('Nombre d echantillons')
xlabel('Distance de Kolomogorov')

figure
histogram(KS_spirit_100, 21)
title('Histogramme des distances de Kolmogrorov pour les spiritueux')
ylabel('Nombre d echantillons')
xlabel('Distance de Kolomogorov')

figure
histogram(KS_wine_100, 21)
title('Histogramme des distances de Kolmogrorov pour le vin')
ylabel('Nombre d echantillons')
xlabel('Distance de Kolomogorov')

figure
histogram(KS_pure_100, 21)
title('Histogramme des distances de Kolmogrorov pour l alcool pur')
ylabel('Nombre d echantillons')
xlabel('Distance de Kolomogorov')


