%Retourne le nombre de rejet de l'hypothèse 
function [nbre_rejet] = Q2A
val_crit = 0.2 + 1.645*(0.2*0.8/20)^(1/2);
proportion_rate = zeros(7, 100);
rejet = zeros(100,1);
%On fait 100 tests pour les 7 instituts
for i = 1 : 100
    sample = generateSample(7, 20);
    for j = 1 : 7
        proportion_rate(j, i) = length(find(sample(j, :) < 10))/20;%Pourcentage de ratage de l'échantillon.
        %On ne regarde que la premiere gazette.
        if proportion_rate(1, i) > val_crit
            rejet(i) = 1;
        end
    end
end
nbre_rejet = length(find(rejet > 0));
end

