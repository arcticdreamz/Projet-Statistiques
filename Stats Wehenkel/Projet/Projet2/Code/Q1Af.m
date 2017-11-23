%Cette fonction renvoie le biais et la variance de l'estimateur m_x sur
%"nbr_sample" échantillons iid de "size_sample" notes finales et sauvegarde les échantillons créé dans sample.mat.
function [biais_mean, variance_mean] = Q1Af(nbr_sample, size_sample)
%% Import the data
[~, ~, raw] = xlsread('proba1ereSession20142015.xls','Données');
raw = raw(2:end,:);

%% Create output variable
data = reshape([raw{:}],size(raw));
notes_moyennes = sum(data, 2)/9;
pop_mean = mean(notes_moyennes);%moyenne de la population
sample_mat = generateSample(nbr_sample, size_sample);
sample_mean = mean(sample_mat, 2);
save('sample.mat', 'sample_mat');
biais_mean = mean(sample_mean) - pop_mean;
variance_mean = var(sample_mean, 1);
end