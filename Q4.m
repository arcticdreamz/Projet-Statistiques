function [rejetUlg, interventionOMS] = Q4()

data = xlsread("Database.xlsx");
beerBelgium = data(93,1);
nbAboveBelgium = zeros(100,6);
n = 50;
echantillons = zeros(n,1,100,6);
interventionOMS = 0;
rejetUlg = 0;

for j = 1:100
    
    rejetInstituts = 0;

    for k = 1:6
        
        
        index_echantillon = randsample(100,n,true);
        
        for i = 1:n
            echantillons(i,1,j,k) = data(index_echantillon(i),1);
            
            %Pays buvant plus de bieres que la Belgique
            if(echantillons(i,1,j,k) > beerBelgium) 
                nbAboveBelgium(j,k) = nbAboveBelgium(j,k) + 1;
            end
        end
        
        % Proportion de pays de l echantillon qui boivent plus de bieres que BE
        propNbAboveBelgium = nbAboveBelgium/n;
        
        %Calcul de la borne 
        proportion = 0.04;
        ecart_type = sqrt(proportion*(1-proportion)/n);
        u = 1.645;
        borne = proportion + (u*ecart_type);
       
        
        if propNbAboveBelgium(j,k) > borne 
            if k == 1
                rejetUlg = rejetUlg + 1;
            else
                rejetInstituts = rejetInstituts +1;
            end
        end
        
        
    end
    % Si au moins 1 institut rejette l'hypothèse, l'OMS intervient
    if rejetInstituts >= 1
        interventionOMS = interventionOMS +1;
    end
end
end

