function Q1C

%Même fonction que les deux précédentes mais cette fois pour un échantillon
%de taille 50

resultats=xlsread('Proba1ereSession20132014.xls'); %récupération des données Excel
matrice_echantillon=zeros(20,50); %Matrice 20 lignes/50 colonnes pour stocker les échantillons

for i=1:50
    
    echantillon = randsample(120,20,true); %Création d'un échantillon de 20 étudiants 
    matrice_echantillon(:,i)=echantillon; %Remplissage de la matrice contenant les 50 échantillons, une colonne = un échantillon

end

%Calcul des notes finales :

note_finale=zeros(120,1);

for j=1:120
    
    note_finale(j)=mean(resultats(j,:));
    
end

%Calcul des notes finales de chaque étudiant de chaque échantillon :

matrice_echantillon_notefinale=zeros(20,50);%Matrice qui contiendra les notes finales de chaque étudiant de chaque échantillon
moyenne_notefinale=zeros(50,1); 
mediane_notefinale=zeros(50,1);


for k=1:50
    
    for l=1:20
        
        matrice_echantillon_notefinale(l,k)=note_finale(matrice_echantillon(l,k));
        
    end
    
    moyenne_notefinale(k)=mean(matrice_echantillon_notefinale(:,k)); 
    mediane_notefinale(k)=median(matrice_echantillon_notefinale(:,k));
    
end

%Calcul du biais : 

moyenne_totale = mean(note_finale);
biaisA = mean(moyenne_notefinale) - moyenne_totale
mediane_totale = median(note_finale);
biaisB = median(mediane_notefinale) - mediane_totale

%Calcul de la variance : 

varianceA = var(moyenne_notefinale,1)
varianceB = var(mediane_notefinale,1)
        

end