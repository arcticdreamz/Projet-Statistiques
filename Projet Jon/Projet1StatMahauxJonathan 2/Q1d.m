% fonction Q1d

function Q1d

X = xlsread('Proba1ereSession20132014.xls');

[u v ] = size(X)
n1 = 0;
n2 = 0;


for i=1:1:u 

moythe(i) = mean(X(i,4:6));

if moythe(i)>=12 && moythe(i)<=15
    n1 = n1+1;
end

moyexo(i) = mean(X(i,7:9));

if moyexo(i)>=12 && moyexo(i)<=15
    n2 = n2+1;
end


end
prop1 = n1/u
prop2 = n2/u

subplot(1,2,1)
cdfplot(moythe);
subplot(1,2,2)
cdfplot(moyexo);

[prop_th x_th] = cdfcalc(moythe);
[prop_ex x_ex] = cdfcalc(moyexo);

borneinfth = prop_th(min(find(x_th>12)))
bornesupth = prop_th(min(find(x_th>15)))

borneinfex = prop_ex(min(find(x_ex>12)))
bornesupex = prop_ex(min(find(x_ex>15)))

propestimeeth = bornesupth-borneinfth
propestimeeex = bornesupex-borneinfex

figure;

scatter(X(:,2),X(:,3))


corrcoef(X(:,2),X(:,3))


end