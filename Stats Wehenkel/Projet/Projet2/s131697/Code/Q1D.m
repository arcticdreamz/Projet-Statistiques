function [nbre_normale, nbre_student] = Q1D
%% Import the data
[~, ~, raw] = xlsread('proba1ereSession20142015.xls','Données');
raw = raw(2:end,:);
%% Create output variable
data = reshape([raw{:}],size(raw));
notes_moyennes = sum(data, 2)/9;
nbr_sample = 100;
size_sample = 20;
pop_mean = mean(notes_moyennes);
t = 2.093;
u = 1.96;
sample = generateSample(nbr_sample, size_sample);
mean_sample  = mean(sample, 2).';
sn_1 = std(sample.', 1);
borne_student = [mean_sample - t*sn_1/(size_sample)^(1/2); mean_sample + t*sn_1/(size_sample)^(1/2)];
borne_normale = [mean_sample - u*sn_1/(size_sample)^(1/2); mean_sample + u*sn_1/(size_sample)^(1/2)];
nbre_student  = 0;
nbre_normale = 0;
%On compte le nombre de notes dans les intervalles.
for i = 1 : nbr_sample
    if(pop_mean > borne_student(1, i) && pop_mean < borne_student(2, i))
        nbre_student = nbre_student + 1;
    end
    if(pop_mean > borne_normale(1, i) && pop_mean < borne_normale(2, i))
        nbre_normale = nbre_normale + 1;
    end
end


end
