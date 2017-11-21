function [beer_rate, spirit_rate] = Q1C()
data = xlsread('Database.xlsx');

[beer, spirit] = Q1B();

% Calcul des bornes de la loi normale
min_beer = beer(1) - beer(4);
max_beer = beer(1) + beer(4);

min_spirit = spirit(1) - spirit(4);
max_spirit = spirit(1) + spirit(4);

% Calcul du pourcentage de pays compris dans cet intervalle
nb_pays = max(size(data));

nb_norm_beer = 0;
nb_norm_spirit = 0;

for i=1:nb_pays
    if data(i,1) >= min_beer && data(i,1) <= max_beer
        nb_norm_beer = nb_norm_beer + 1;
    end
    
    if data(i,2) >= min_spirit && data(i,2) <= max_spirit
        nb_norm_spirit = nb_norm_spirit + 1;
    end
end

beer_rate = nb_norm_beer/nb_pays;
spirit_rate = nb_norm_spirit/nb_pays;

end

