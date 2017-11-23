function [matrice_echantillon_notefinale moyenne_notefinale moyenne_totale note_finale]=Q1A

resultats=xlsread('Proba1ereSession20132014.xls'); %r�cup�ration des donn�es Excel
matrice_echantillon=zeros(20,100); %Matrice 20 lignes/100 colonnes pour stocker les �chantillons

for i=1:100
    
    echantillon = randsample(120,20,true); %Cr�ation d'un �chantillon de 20 �tudiants 
    matrice_echantillon(:,i)=echantillon; %Remplissage de la matrice contenant les 100 �chantillons, une colonne = un �chantillon

end



%Calcul des notes finales de la population : 

note_finale=zeros(120,1);

for j=1:120
    
    note_finale(j)=mean(resultats(j,:));
    
end

%Calcul des notes finales de chaque �tudiant de chaque �chantillon :

matrice_echantillon_notefinale=zeros(20,100);%Matrice qui contiendra les notes finales de chaque �tudiant de chaque �chantillon
moyenne_notefinale=zeros(100,1); %Vecteur de la nouvelle variable

for k=1:100
    
    for l=1:20
        
        matrice_echantillon_notefinale(l,k)=note_finale(matrice_echantillon(l,k));
        
    end
    
    moyenne_notefinale(k)=mean(matrice_echantillon_notefinale(:,k));    
    
end

%Calcul du biais : 

moyenne_totale = mean(note_finale);
biais = mean(moyenne_notefinale) - moyenne_totale

%Calcul de la variance : 

variance = var(moyenne_notefinale,1)
        

end

