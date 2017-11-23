function Q2

resultats=xlsread('Proba1ereSession20132014.xls'); %r�cup�ration des donn�es Excel
matrice_echantillon=zeros(20,7); %Matrice 20 lignes/7 colonnes pour stocker les �chantillons

%Calcul des notes finales :

note_finale=zeros(120,1);

for j=1:120
    
    note_finale(j)=mean(resultats(j,:));
    
end

%100 tirages des 7 �chantillons de 20 �tudiants :

proportion=1/8;
compteur=zeros(7,1);
ecart_type = sqrt((proportion*(1-proportion))/20);
proportion_moins10=zeros(7,1);
z=1.645;
borne_sup=proportion+(z*ecart_type);
nbre_articles=0;

for m=1:100

for i=1:7
    
    echantillon = randsample(120,20,true); %Cr�ation d'un �chantillon de 20 �tudiants 
    matrice_echantillon(:,i)=echantillon; %Remplissage de la matrice contenant les 7 �chantillons, une colonne = un �chantillon

end


%Calcul des notes finales de chaque �tudiant de chaque �chantillon :

matrice_echantillon_notefinale=zeros(20,7);%Matrice qui contiendra les notes finales de chaque �tudiant de chaque �chantillon
nombre_moins10=zeros(7,1);
x=0;

for k=1:7
    
    for l=1:20
        
        matrice_echantillon_notefinale(l,k)=note_finale(matrice_echantillon(l,k));
        
        if matrice_echantillon_notefinale(l,k)<=10
            nombre_moins10(k)= nombre_moins10(k) + 1;
        
        end
        
        
    end
    proportion_moins10(k)=nombre_moins10(k)/20;
    
    if proportion_moins10(k)>borne_sup
        %Hypoth�se rejet�e
        compteur(k)=compteur(k)+1;
    
    end
    
    if proportion_moins10(k)>borne_sup && k~=1
        %Un organisme rejette l'hypoth�se
        x=1;
    end
    
end

nbre_articles=nbre_articles+x;

end
disp('Les autorit�s de l Ulg ont rejet� l hypoth�se dans le nombre de cas suivant : ');
compteur(1)
disp('Un article sera publi� le nombre de fois suivant :');
nbre_articles

end

