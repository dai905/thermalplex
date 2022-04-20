data_57C = readmatrix('65C/65C_puncata_number.txt');


close all;
hfig = figure;
figure(1);
a = errorbarplot([1:1:6],data_57C(:,7),data_57C(:,8),hfig,0.5,[]);

for c1 = 1:size(data_57C,1)
    
    cell_counts = data_57C(c1,1:6);
    r = c1+unifrnd(-0.2,0.2,[1,6]);
    plot(r,cell_counts,'.','markersize',15,'color','k');
    
    
end

xlabel('Heating Time (s)');
ylabel('Puncta counts in cells');
set(gca,'fontsize',24,'linewidth',1);
ylim([0 45]);
xticklabels({'5','10','15','20','25','30'});
box on;
axis square;