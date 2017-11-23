%fonction generant les 3 histogrammes des resultats des questions de
%theorie

function Q1

X = xlsread('Proba1ereSession20132014.xls');

[m n] = size(X);

T1 = X(:,4);
T2 = X(:,5);
T3 = X(:,6);
subplot(1,3,1)
hist(T1,20);
subplot(1,3,2)
hist(T2,20);
axis([0 22 0 18]);
subplot(1,3,3)
hist(T3,20);
axis([0 22 0 25]);
figure

M1 = mean(X(:,7))
M2 = mean(X(:,8))
M3 = mean(X(:,9))

med1 = median(X(:,7))
med2 = median(X(:,8))
med3 = median(X(:,9))

mod1 = mode(X(:,7))
mod2 = mode(X(:,8))
mod3 = mode(X(:,9))

s1 = sqrt(var(X(:,7),1))
s2 = sqrt(var(X(:,8),1))
s3 = sqrt(var(X(:,9),1))

norm1 = [M1-s1, M1+s1]
norm2 = [M2-s2, M2+s2]
norm3 = [M3-s3, M3+s3]

n1 = 0;
n2 = 0;
n3 = 0;
for i=1:1:m
    
    if X(i,7)>= norm1(1) && X(i,7)<= norm1(2)
        n1 = n1+1;
    end
    
    if X(i,8)>= norm2(1) && X(i,8)<= norm2(2)
        n2 = n2+1;
    end
    
    if X(i,9)>= norm3(1) && X(i,9)<= norm3(2)
        n3 = n3+1;
    end
    
end 

prop1 = n1/m
prop2 = n2/m
prop3 = n3/m

subplot(1,3,1)
moustache1 = boxplot(X(:,1))
subplot(1,3,2)
moustache2 = boxplot(X(:,2))
subplot(1,3,3)
moustache3 = boxplot(X(:,3))

quart1 = quantile(X(:,1),[.25 .50 .75])
quart2 = quantile(X(:,2),[.25 .50 .75])
quart3 = quantile(X(:,3),[.25 .50 .75])



end


