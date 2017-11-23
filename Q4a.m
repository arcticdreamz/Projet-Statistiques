importData;
beerBelgium = dataset(93,1);
nbAboveBelgium = zeros(100,6);

for(k = 1:6)
    for(j = 1:100)
        
        index_echantillon = randsample(100,49,false);
        
        for i = 2:50
            echantillons(1,1,j,k) = beerBelgium; %Belgique
            echantillons(i,1,j,k) = dataset(index_echantillon(i-1),1);
        end
        
        proportion = 0.95;
        n = 20;
        ecart_type = sqrt(proportion*(1-proportion)/n);
        z=1.96;
        borne_inf = proportion+(z*ecart_type);        
       
        
        if(echantillons(i,1,j,k) > beerBelgium) 
            nbAboveBelgium(j,k) = nbAboveBelgium(j,k) + 1;
        end
        
        propNbAboveBelgium = nbAboveBelgium/50;

        
        
        
    end
end
propNbAboveBelgium(:,1)
nb = length(find(nbAboveBelgium(:,1) > 0));
