function [data1Ech, DistKS] = Q2a()
data = xlsread("Database.xlsx");
% On prend 1 echantillon de 20 pays au hasard
index_echantillon = randsample(100,20,false);

echantillon = zeros(20,4);
for i = 1:20
    echantillon(i,1:4) = data(index_echantillon(i),:);
end



beer_data = echantillon(:,1);
spirit_data = echantillon(:,2);

% Calcul de la mediane pour la consommation de biere et d alcool fort
median_beer = median(beer_data);
median_spirit = median(spirit_data);

% Calcul de la moyenne pour la consommation de biere et d alcool fort

mean_beer = mean(beer_data);
mean_spirit = mean(spirit_data);

% Calcul de l ecart-type pour la consommation de biere et d alcool fort

std_beer = std(beer_data);
std_spirit = std(spirit_data);

figure;
boxplot(beer_data);
title("Consommation de biere au monde d un echantillon de 20");
ylabel("Nombres de canettes");


figure;
boxplot(spirit_data);
title("Consommation d alcool fort au monde d un echantillon de 20");
ylabel("Nombres de shots");

figure;
pop = cdfplot(data(:,1));
hold on;
set(pop,'color','r');
ech = cdfplot(beer_data);
set(ech,'color','b');
title({"Polygone de frequence cumulee de la consommation de biere";"de la population et d un echantillon de 20"});

legend("show");
legend("Population","Echantillon");
legend("Location","southeast");
legend("boxoff");
ylabel("Frequence");
xlabel("Nombres de canettes");
hold off;



figure
pop = cdfplot(data(:,2));
hold on;
set(pop,'color','r');
ech = cdfplot(spirit_data);
set(ech,'color','b');
legend("show");
legend("Population","Echantillon");
legend("Location","southeast");
legend("boxoff");
ylabel("Frequence");
xlabel("Nombres de shots");
title({"Polygone de frequence cumulee de la consommation d alcool fort";"de la population et d un echantillon de 20"});

[~,~,KS_beer] = kstest2(beer_data,(data(:,1)));
[~,~,KS_spirit] = kstest2(spirit_data,(data(:,2)));

DistKS = [KS_beer,KS_spirit];
data1Ech = [median_beer,median_spirit,mean_beer,mean_spirit,std_beer,std_spirit];
end
