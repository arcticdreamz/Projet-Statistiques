%Cette fonction renvoie le biais et la variance de l'estimateur m_x sur
%"nbr_sample" échantillons iid de "size_sample" notes finales à partir des échantillons sauvegardés dans sample.mat.
function [biais_median, variance_median] = Q1Bf(nbr_sample, size_sample)
%% Import the data
[~, ~, raw] = xlsread('proba1ereSession20142015.xls','Données');
raw = raw(2:end,:);

%% Create output variable
data = reshape([raw{:}],size(raw));
notes_moyennes = sum(data, 2)/9;
pop_mean = mean(notes_moyennes);
load('sample.mat');
sample_median = median(sample_mat, 2);
biais_median = mean(sample_median) - pop_mean;
variance_median = var(sample_median, 1);
end
