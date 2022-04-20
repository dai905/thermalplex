data_matrix = [];

temperature_set = [39,48,57,65,72];

for c1 = 1:length(temperature_set)
    
    temperature = temperature_set(c1);
    file_list = dir(sprintf('%dC/*puncta_info.txt',temperature));
    
    for c2 = 1:length(file_list)
        file_name = file_list(c2).name;
        data = readmatrix(sprintf('%dC/%s',temperature,file_name));
        
        puncta_number = size(data,1);
        data_matrix(c2,c1) = puncta_number;
        
        fprintf('%s in row:%d column:%d\n',file_name,c2,c1);
    end    
end

cell_count = xlsread('Cell_counts.xlsx');
count_per_cell = data_matrix./cell_count;


figure(1);
imagesc(count_per_cell);
%colormap('jet');
colorbar;
set(gca,'fontsize',22);
a = colorbar;
a.Label.String = 'Puntca counts per cell';
axis square;
xlabels = {'39 ^oC','48 ^oC','57 ^oC','65 ^oC','72 ^oC'};
ylabels = {'39 ^oC thermal probe','48 ^oC thermal probe','57 ^oC thermal probe',...
           '65 ^oC thermal probe','72 ^oC thermal probe'};
xticklabels(xlabels);
yticks([1 2 3 4 5]);
yticklabels(xlabels);
set(gcf,'renderer','painters')
print(1,'-depsc','cell_counts_heatmap.eps');