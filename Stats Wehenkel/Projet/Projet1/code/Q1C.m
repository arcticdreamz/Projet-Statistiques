function Q1C
%% Import the data
[~, ~, raw] = xlsread('/Users/antoinewehenkel/Documents/Ecole/2015-2016/Stats/Projet/Projet1/proba1ereSession20142015.xls','Données');
raw = raw(2:end,:);

%% Create output variable
data = reshape([raw{:}],size(raw));

%% Allocate imported array to column variable names
Projet1 = data(:,1);
Projet2 = data(:,2);
Qprojet2 = data(:,3);

Proj = [Projet1 Projet2 Qprojet2];

%% Clear temporary variables
clearvars data raw;

f1 = figure();
boxplot(Projet1)
t1 = title('Boite a moustache pour les notes du projet 1');
y1 = ylabel('Note');
set(t1, 'Fontsize', 15);
set(y1, 'Fontsize', 15);
saveas(f1,'Fig/Q1C1.fig');
saveas(f1,'Fig/Q1C1.eps');

f1 = figure();
boxplot(Projet2)
t1 = title('Boite a moustache pour les notes du projet 2');
y1 = ylabel('Note')
set(t1, 'Fontsize', 15);
set(y1, 'Fontsize', 15);
saveas(f1,'Fig/Q1C2.fig');
saveas(f1,'Fig/Q1C2.eps');

f1 = figure();
boxplot(Qprojet2)
t1 = title('Boite a moustache pour les notes de la question portant sur le projet 2');
y1 = ylabel('Note')
set(t1, 'Fontsize', 10);
set(y1, 'Fontsize', 15);
saveas(f1,'Fig/Q1C3.fig');
saveas(f1,'Fig/Q1C3.eps');

disp('Premiers quartiles(0,25)')
Q1 = quantile(Proj, 0.25)
disp('Deuxiemes quartiles(médiane)')
Q2 = quantile(Proj, 0.5)
disp('Troisième quartiles (0,75)')
Q3 = quantile(Proj, 0.75)

end