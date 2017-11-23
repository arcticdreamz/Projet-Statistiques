function Q1D
%% Import the data
[~, ~, raw] = xlsread('/Users/antoinewehenkel/Documents/Ecole/2015-2016/Stats/Projet/Projet1/proba1ereSession20142015.xls','Données');
raw = raw(2:end,:);

%% Create output variable
data = reshape([raw{:}],size(raw));

%% Allocate imported array to column variable names
Theorie1 = data(:,4);
Theorie2 = data(:,5);
Theorie3 = data(:,6);
Exercice1 = data(:,7);
Exercice2 = data(:,8);
Exercice3 = data(:,9);

%% Clear temporary variables
clearvars data raw;

%Définitions des deux nouvelles variables.
Th_mean = (Theorie1 + Theorie2 + Theorie3)/3;
Ex_mean = (Exercice1 + Exercice2 + Exercice3)/3;

%Polygones des fréquences cumulées
f1 = figure();
cdfplot(Th_mean);
t1 = title('Polygone de frequence cumulees de la moyenne des questions de theorie');
x1 = xlabel('Note');
y1 = ylabel('Proportion');
set(t1, 'Fontsize', 9);
set(x1, 'Fontsize', 15);
set(y1, 'Fontsize', 15);
saveas(f1,'Fig/Q1D1.fig');
saveas(f1,'Fig/Q1D1.eps');


f2 = figure();
cdfplot(Ex_mean);
t2 = title('Polygone de frequence cumulees de la moyenne des questions d exercice');
x2 = xlabel('Note');
y2 = ylabel('Proportion');
set(t2, 'Fontsize', 9);
set(x2, 'Fontsize', 15);
set(y2, 'Fontsize', 15);
saveas(f2,'Fig/Q1D2.fig');
saveas(f2,'Fig/Q1D2.eps');




%Proportion d'étudiants ayant une note entre 10 et 14
disp('La proportion d etudiant ayant une moyenne aux questions de theorie comprise entre 10 et 14 est: ')
length(Th_mean(Th_mean >= 10 & Th_mean <= 14))/length(Th_mean)
disp('La proportion d etudiant ayant une moyenne aux exercices comprise entre 10 et 14 est: ')
length(Ex_mean(Ex_mean >= 10 & Ex_mean <= 14))/length(Ex_mean)
end