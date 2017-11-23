importData;
beerBelgium = dataset(93,1);
nbAboveBelgium = zeros(100,6);
rejets = zeros(1,6);
n = 50;
for(j = 1:100)
    for(k = 1:6)

        
        index_echantillon = randsample(100,n-1,false);
        
        for i = 2:n
            echantillons(1,1,j,k) = beerBelgium; %Belgique
            echantillons(i,1,j,k) = dataset(index_echantillon(i-1),1);
            
            %Pays buvant plus de bieres que la Belgique
            if(echantillons(i,1,j,k) > beerBelgium) 
                nbAboveBelgium(j,k) = nbAboveBelgium(j,k) + 1;
            end
        end
        
        % Proportion de l echantillon qui boivent plus de bieres que BE
        propNbAboveBelgium = nbAboveBelgium/n;
        
        %Calcul de la borne 
        proportion = 0.95;
        ecart_type = sqrt(proportion*(1-proportion)/n);
        z = 1.96;
        borne = proportion - (z*ecart_type);
       
        

        if propNbAboveBelgium(j,k) > borne 
            rejets(k) = rejets(k) +1;
        end
        
        
    end
end
% borne
% nbAboveBelgium
rejets
rejetUlg = rejets(1)
