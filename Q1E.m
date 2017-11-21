function Q1E()
data = xlsread('Database.xlsx');

cdfplot(data(:,1));
xlabel('Nombre de canettes consomees)');
ylabel('Frequences cumulees');
title('Polygone des frequences cumulees de la consommation de biere');

end

