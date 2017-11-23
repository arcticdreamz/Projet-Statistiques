function Q1C

%M�me fonction que les deux pr�c�dentes mais cette fois pour un �chantillon
%de taille 50

resultats=xlsread('Proba1ereSession20132014.xls'); %r�cup�ration des donn�es Excel
matrice_echantillon=zeros(20,50); %Matrice 20 lignes/50 colonnes pour stocker les �chantillons

for i=1:50
    
    echantillon = randsample(120,20,true); %Cr�ation d'un �chantillon de 20 �tudiants 
    matrice_echantillon(:,i)=echantillon; %Remplissage de la matrice contenant les 50 �chantillons, une colonne = un �chantillon

end

%Calcul des notes finales :

note_finale=zeros(120,1);

for j=1:120
    
    note_finale(j)=mean(resultats(j,:));
    
end

%Calcul des notes finales de chaque �tudiant de chaque �chantillon :

matrice_echantillon_notefinale=zeros(20,50);%Matrice qui contiendra les notes finales de chaque �tudiant de chaque �chantillon
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