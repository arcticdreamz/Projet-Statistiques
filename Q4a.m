importData;

for(k = 1:6)
    for(j = 1:100)
        index_echantillon = randsample(100,19,false);
        for i = 1:19
            echantillons(1,:,j,k) = dataset(93,:,:,:); %Belgique
            echantillons(i+1,:,j,k) = dataset(index_echantillon(i),:);
        end
    end
end
