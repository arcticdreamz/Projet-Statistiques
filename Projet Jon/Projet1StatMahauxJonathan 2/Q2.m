
function Q2

X = xlsread('Proba1ereSession20132014.xls');

[m n] = size(X);

echantillon = randsample(m,20,true)

for i=1:1:20
    
    val_echantillon(i,1:9) = X(echantillon(i),:);
    moytheech(i) = mean(val_echantillon(i,4:6));
    
end

for k=1:1:m
    moythe(k) = mean(X(k,4:6));
end

m_ex1_ech = mean(val_echantillon(:,7))
m_ex2_ech = mean(val_echantillon(:,8))
m_ex3_ech = mean(val_echantillon(:,9))

med_ex1_ech = median(val_echantillon(:,7))
med_ex2_ech = median(val_echantillon(:,8))
med_ex3_ech = median(val_echantillon(:,9))

s1 = std(val_echantillon(:,7),1)
s2 = std(val_echantillon(:,8),1)
s3 = std(val_echantillon(:,9),1)

subplot(1,3,1);
beard1 = boxplot(val_echantillon(:,1));
ylim([0 20]);
subplot(1,3,2);
beard2 = boxplot(val_echantillon(:,2));
ylim([0 20]);
subplot(1,3,3);
beard3 = boxplot(val_echantillon(:,3));
ylim([0 20]);


quart1 = quantile(val_echantillon(:,1),[.25 .50 .75])
quart2 = quantile(val_echantillon(:,2),[.25 .50 .75])
quart3 = quantile(val_echantillon(:,3),[.25 .50 .75])

figure

cdfplot(moytheech)
hold on
cdfplot(moythe)
hold off

ksdist1 = cdfcalc(moytheech) 
ksdist2 = cdfcalc(moythe)

[h p dist] = kstest2(ksdist1,ksdist2)

%partie b

pop1 = cdfcalc(X(:,7));
pop2 = cdfcalc(X(:,8));
pop3 = cdfcalc(X(:,9));


for i=1:1:100
    echantillon = randsample(m,20,true);
    for k=1:1:20
        valeur_echantillon(k,1:9) = X(echantillon(k),:);
    end
    
    ex1 = cdfcalc(valeur_echantillon(:,7));
    ex2 = cdfcalc(valeur_echantillon(:,8));
    ex3 = cdfcalc(valeur_echantillon(:,9));
    
    [a(i) b(i) dist1(i)] = kstest2(ex1,pop1);
    [c(i) d(i) dist2(i)] = kstest2(ex2,pop2);
    [e(i) f(i) dist3(i)] = kstest2(ex3,pop3);
    
 moyex1iid(i)= mean(valeur_echantillon(:,7));
 
 medianeiid(i) = median(valeur_echantillon(:,7));
 
 siid(i) = std(valeur_echantillon(:,7),1);
 
end


figure
hist(moyex1iid,20);
figure
hist(medianeiid,20);
figure
hist(siid,20);

moyenne = mean(moyex1iid)
moymed = mean(medianeiid)
moyectype=mean(siid)

figure
hist(dist1,20)
mean(dist1)
figure
hist(dist2,20)
mean(dist2)
figure
hist(dist3,20)
mean(dist3)
end


 
