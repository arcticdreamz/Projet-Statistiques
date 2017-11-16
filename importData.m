%Contains text and numbers
[~,~,raw] = xlsread("Database.xlsx",1,'A2:E101'); 
dataset = cell2mat(raw(1:100,2:5)); % Contains only numbers
dataset1 = xlsread("Database.xlsx");