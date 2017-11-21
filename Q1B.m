function [beer, spirit] = Q1B()
data = xlsread('Database.xlsx');

beer_data = data(:,1);
spirit_data = data(:,2);

% Calcul des moyennes
beer_mean = mean(beer_data);
spirit_mean = mean(spirit_data);

% Calcul des medianes
beer_median = median(beer_data);
spirit_median = median(spirit_data);

% Calcul des modes
beer_mode = mode(beer_data);
spirit_mode = mode(spirit_data);

% Calcul des ecart-types
beer_std = std(beer_data);
spirit_std = std(spirit_data);

beer = [beer_mean, beer_median, beer_mode, beer_std];
spirit = [spirit_mean, spirit_median, spirit_mode, spirit_std];

end

