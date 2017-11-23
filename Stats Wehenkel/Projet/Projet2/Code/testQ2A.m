function testQ2A
biais_mean = 0;
variance_mean = 0;
biais_median = 0;
variance_median = 0;
for i = 1 : 100
    [tmp tmp2] = Q1Af(100, 20);
    biais_mean = biais_mean + tmp;
    variance_mean = variance_mean + tmp2;
    [tmp tmp2] = Q1Bf(100, 20);
    biais_median = biais_median + tmp;
    variance_median = variance_median + tmp2;
end
biais_mean/100
variance_mean/100
biais_median/100
variance_median/100
end