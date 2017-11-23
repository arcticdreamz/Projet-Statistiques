function Q2A
%% Import the data
[~, ~, raw] = xlsread('/Users/antoinewehenkel/Documents/Ecole/2015-2016/Stats/Projet/Projet1/proba1ereSession20142015.xls','Données');
raw = raw(2:end,:);

%% Create output variable
data = reshape([raw{:}],size(raw));

%% Allocate imported array to column variable names
Projet1 = data(:,1);
Projet2 = data(:,2);
Qprojet2 = data(:,3);
Theorie1 = data(:,4);
Theorie2 = data(:,5);
Theorie3 = data(:,6);
Exercice1 = data(:,7);
Exercice2 = data(:,8);
Exercice3 = data(:,9);

%% Clear temporary variables
clearvars data raw;
%% I
%On génère un échantillon de 20 élèves aléatoire
sample = randsample(length(Projet1), 20, true);

size_sample = length(sample);

sample_Exercice1 = zeros(1, size_sample);
sample_Exercice2 = zeros(1, size_sample);
sample_Exercice3 = zeros(1, size_sample);
sample_Proj1 = zeros(1, size_sample);
sample_Proj2 = zeros(1, size_sample);
sample_Qproj2 = zeros(1, size_sample);



for i = 1 : size_sample
    sample_Exercice1(i) = Exercice1(sample(i));
    sample_Exercice2(i) = Exercice2(sample(i));
    sample_Exercice3(i) = Exercice3(sample(i));
    sample_Proj1(i) = Projet1(sample(i));
    sample_Proj2(i) = Projet2(sample(i));
    sample_Qproj2(i) = Qprojet2(sample(i));
    sample_Th1(i) = Theorie1(sample(i));
    sample_Th2(i) = Theorie2(sample(i));
    sample_Th3(i) = Theorie3(sample(i));
end
sample_ex = [sample_Exercice1.', sample_Exercice2.', sample_Exercice3.'];

%On calcule les differentes valeurs demandées(moyenne, médiane et ecart
%type)
disp('Les moyennes de l échantillon sont:')
mean(sample_ex)
disp('Les médianes de l échantillon sont:')
median(sample_ex)
disp('Les ecarts type de l échantillon sont:')
std(sample_ex, 1)
%% II
%dessin des boites à moustache des résultats au projet pour l'échantillon.
figure()
boxplot(sample_Proj1)
title('Boite à moustache pour les notes du projet 1')
ylabel('Note')

figure()
boxplot(sample_Proj2)
title('Boite à moustache pour les notes du projet 2')
ylabel('Note')

figure()
boxplot(sample_Qproj2)
title('Boite à moustache pour les notes de la question portant sur le projet 2')
ylabel('Note')
figure()

%% III
%Création de la nouvelle variable.
mean_sample_Th = (sample_Th1 + sample_Th2 + sample_Th3)/3;
mean_Th = (Theorie1 + Theorie2 + Theorie3)/3;
%Graphe du polygone des fréquences cumulées de la moyenne des questions de
%theorie de l'échantillon
cdfplot(mean_sample_Th);
%Graphe des fr. cumulées de la moyenne des questions de théorie de la
%population
hold on 
h=cdfplot(mean_Th);
set(h,'color','r')
title('Polygone des fréquence cumulées de la moyenne des questions de théorie')
xlabel('Note')
ylabel('Proportion')
%Distance de Kolmogorov Smirnov
[~, ~, dist_ks]=kstest2(mean_Th, mean_sample_Th);
disp('la distance de Kolmogorov Smirnoff est:')
dist_ks
end
    
    
    
    
    
    
    
