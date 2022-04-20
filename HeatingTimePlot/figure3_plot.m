data_read = xlsread('Data1.xlsx');
data_read(:,1) = [];

data_mean = [];
data_var = [];

sample_name = {'No Input','A THEN B','B THEN A'};

for c1 = 1:3
    
    cur_data1 = mean(data_read(c1,1:3));
    cur_data2 = mean(data_read(c1,4:6));
    
    data_mean(end+1,:) = [cur_data1 cur_data2];
    
    cur_data1_var = std(data_read(c1,1:3));
    cur_data2_var = std(data_read(c1,4:6));
      
    data_var(end+1,:) = [cur_data1_var cur_data2_var];    
    
end

close all;
hfig = figure;
figure(1);
a = errorbarplot([1:1:3],data_mean,data_var,hfig,[],[]);
a(2).Color = [0 0.3 0.8];

set(gca,'FontSize',24);
set(gca,'XTickLabel',sample_name);
legend('miRNA','Hairpin','location','Northwest');
%ylim([0 1.6*10^5]);
ylabel('Fluorescent Intensity (a.u.)')
box on;
print(1,'-depsc','data1.eps');
