function [sample] = generateSample(nbre_sample, size_sample)
%% Import the data
[~, ~, raw] = xlsread('proba1ereSession20142015.xls','Données');
raw = raw(2:end,:);

%% Create output variable
data = reshape([raw{:}],size(raw));
notes_moyennes = sum(data, 2)/9;
%On génère les moyennes de n échantillons de k élèves pour l'exercice 1
sample = zeros(nbre_sample, size_sample);

for j = 1 : nbre_sample   
    sample_tmp = randsample(length(notes_moyennes), size_sample, true);
    for i = 1 : size_sample
        sample(j, i) = notes_moyennes(sample_tmp(i));
    end
end
end
