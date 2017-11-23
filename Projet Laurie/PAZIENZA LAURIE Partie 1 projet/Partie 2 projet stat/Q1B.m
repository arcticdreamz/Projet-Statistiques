function Q1B

%Cette fonction est la même que la fonction Q1A mais pour le calcul de la
%médiane

resultats=xlsread('Proba1ereSession20132014.xls'); %récupération des données Excel
matrice_echantillon=zeros(20,100); %Matrice 20 lignes/100 colonnes pour stocker les échantillons

for i=1:100
    
    echantillon = randsample(120,20,true); %Création d'un échantillon de 20 étudiants 
    matrice_echantillon(:,i)=echantillon; %Remplissage de la matrice contenant les 100 échantillons, une colonne = un échantillon

end


%Calcul des notes finales de la population: 

note_finale=zeros(120,1);

for j=1:120
    
    note_finale(j)=mean(resultats(j,:));
    
end

%Calcul des notes finales de chaque étudiant de chaque échantillon :

matrice_echantillon_notefinale=zeros(20,100);%Matrice qui contiendra les notes finales de chaque étudiant de chaque échantillon
mediane_notefinale=zeros(100,1); %Vecteur de la nouvelle variable

for k=1:100
    
    for l=1:20
        
        matrice_echantillon_notefinale(l,k)=note_finale(matrice_echantillon(l,k));
        
    end
    
    mediane_notefinale(k)=median(matrice_echantillon_notefinale(:,k));  
    
end
    
%Calcul du biais : 

mediane_totale = median(note_finale);
biais = median(mediane_notefinale) - mediane_totale

%Calcul de la variance : 

variance = var(mediane_notefinale,1)
        
    
end