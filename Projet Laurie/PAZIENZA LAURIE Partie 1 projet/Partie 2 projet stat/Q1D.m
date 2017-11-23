function Q1D

resultats=xlsread('Proba1ereSession20132014.xls'); %récupération des données Excel

[matrice_echantillon_notefinale moyenne_notefinale moyenne_totale note_finale]=Q1A;%récupération des données calculées à la question 1A

borne_min1=zeros(100,1);%Initialisation des vecteurs contenant les bornes de l'intervalle de confiance pour la loi de student
borne_max1=zeros(100,1);
borne_min2=zeros(100,1);%Initialisation des vecteurs contenant les bornes de l'intervalle de confiance pour la loi de Gauss
borne_max2=zeros(100,1);
somme=zeros(100,1);
sn_1=zeros(100,1);
sn=zeros(100,1);

%Calcul de s_n-1 :

for j=1:100
    
    for k=1:20
        
        somme(j)= somme(j) + (matrice_echantillon_notefinale(k,j)- moyenne_notefinale(j))^2; 
    
    end
    
    sn_1(j) = sqrt(somme(j)/19);
    sn(j) = sqrt(19/20)*sn_1(j);
    
end

%Calcul des bornes des intervalles de confiance : 

t = 2.093;
u = 1.96;
compteur1=0; %Compteur pour la loi de student
compteur2=0; %Compteur pour la loi de Gauss 

for i=1:100
    
    borne_min1(i) = moyenne_notefinale(i)-(t*sn_1(i)/sqrt(20));
    borne_max1(i) = moyenne_notefinale(i)+(t*sn_1(i)/sqrt(20));
    borne_min2(i) = moyenne_notefinale(i)-(u*sn(i)/sqrt(20));
    borne_max2(i) = moyenne_notefinale(i)+(u*sn(i)/sqrt(20));
    
    if moyenne_totale>=borne_min1(i) && moyenne_totale<=borne_max1(i)
        compteur1=compteur1+1;
    end
    
    if moyenne_totale>=borne_min2(i) && moyenne_totale<=borne_max2(i)
        compteur2=compteur2+1;
    end
end
borne_min1bis=mean(borne_min1)
borne_max1bis=mean(borne_max1)
borne_min2bis=mean(borne_min2)
borne_max2bis=mean(borne_max2)
compteur1
compteur2


end