function Q1A
%% Import the data
[~, ~, raw] = xlsread('/Users/antoinewehenkel/Documents/Ecole/2015-2016/Stats/Projet/Projet1/proba1ereSession20142015.xls','Données');
raw = raw(2:end,:);

%% Create output variable
data = reshape([raw{:}],size(raw));

%% Allocate imported array to column variable names
Theorie1 = data(:,4);
Theorie2 = data(:,5);
Theorie3 = data(:,6);

%% Clear temporary variables
nbr_col = 21;
clearvars data raw;
f1 = figure();
hist(Theorie1, nbr_col);
t1 = title('Histogramme des notes a la question de theorie 1');
y1 = ylabel('Nombre d etudiants');
x1 = xlabel('Note');
set(t1, 'Fontsize', 15);
set(x1, 'Fontsize', 15);
set(y1, 'Fontsize', 15);
saveas(f1,'Fig/Q1A1.fig');
saveas(f1,'Fig/Q1A1.eps');

f1 = figure();
hist(Theorie2, nbr_col);
t1 = title('Histogramme des notes a la question de theorie 2');
y1 = ylabel('Nombre d etudiants');
x1 = xlabel('Note');
set(t1, 'Fontsize', 15);
set(x1, 'Fontsize', 15);
set(y1, 'Fontsize', 15);
saveas(f1,'Fig/Q1A2.fig');
saveas(f1,'Fig/Q1A2.eps');

f1 = figure();
hist(Theorie3, nbr_col);
t1 = title('Histogramme des notes a la question de theorie 3');
y1 = ylabel('Nombre d etudiants');
x1 = xlabel('Note');
set(t1, 'Fontsize', 15);
set(x1, 'Fontsize', 15);
set(y1, 'Fontsize', 15);
saveas(f1,'Fig/Q1A3.fig');
saveas(f1,'Fig/Q1A3.eps');
end