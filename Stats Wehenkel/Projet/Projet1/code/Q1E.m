function Q1E
%% Import the data
[~, ~, raw] = xlsread('/Users/antoinewehenkel/Documents/Ecole/2015-2016/Stats/Projet/Projet1/proba1ereSession20142015.xls','Données');
raw = raw(2:end,:);

%% Create output variable
data = reshape([raw{:}],size(raw));

%% Allocate imported array to column variable names
Projet2 = data(:,2);
Qprojet2 = data(:,3);

%% Clear temporary variables
clearvars data raw;

%Scatter plot permetant de comparer Projet2 et Qprojet2
f1 = figure();
scatter(Projet2, Qprojet2)
x1 = xlabel('Resultats du projet 2');
y1 = ylabel('Resultats de la question sur le projet 2');
t1 = title('Nuage de points comparant les resultats du projet 2 et ceux de la question sur le projet 2');
set(t1, 'Fontsize', 10);
set(x1, 'Fontsize', 15);
set(y1, 'Fontsize', 15);
saveas(f1,'Fig/Q1E1.fig');
saveas(f1,'Fig/Q1E1.eps');

%Coefficient de correlation entre les notes au projets 2 et à la question
%portant sur ce dernier
coef = corrcoef(Projet2, Qprojet2);
disp('Coefficient de correlation entre les notes au projets 2 et à la question')
coef(2,1)
end