function Q1B
%% Import the data
[~, ~, raw] = xlsread('/Users/antoinewehenkel/Documents/Ecole/2015-2016/Stats/Projet/Projet1/proba1ereSession20142015.xls','Données');
raw = raw(2:end,:);

%% Create output variable
data = reshape([raw{:}],size(raw));

%% Allocate imported array to column variable names
Exercice1 = data(:,7);
Exercice2 = data(:,8);
Exercice3 = data(:,9);

Exercice = [Exercice1 Exercice2 Exercice3];
%% Clear temporary variables
clearvars data raw;
disp('Moyenne')
mean_ex = mean(Exercice)
disp('Médiane')
median_ex = median(Exercice)
disp('Mode')
mode_ex = mode(Exercice)
disp('Ecart type')
et_ex = std(Exercice, 1)
disp('Borne inférieure d un résultat normal')
inf_born_ex = mean_ex - et_ex
disp('Borne supérieure d un résultat normal')
sup_born_ex = mean_ex + et_ex
disp('proportion d étudiants ayant réalisé un résultat "normal"')
prop_norm_ex = [length(Exercice1(Exercice1 >= inf_born_ex(1) & Exercice1 <= sup_born_ex(1)))/length(Exercice1) length(Exercice2(Exercice2 >= inf_born_ex(2) & Exercice2 <= sup_born_ex(2)))/length(Exercice2) length(Exercice3(Exercice3 >= inf_born_ex(3) & Exercice3 <= sup_born_ex(3)))/length(Exercice3)]
end