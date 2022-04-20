RNA_39C_488 = readmatrix('15_RNA_39C_488.txt');
RNA_39C_565 = readmatrix('15_RNA_39C_565.txt');
RNA_39C_647 = readmatrix('15_RNA_39C_647.txt');

RNA_48C_488 = readmatrix('15_RNA_48C_488.txt');
RNA_48C_565 = readmatrix('15_RNA_48C_565.txt');
RNA_48C_647 = readmatrix('15_RNA_48C_647.txt');

RNA_57C_488 = readmatrix('15_RNA_57C_488.txt');
RNA_57C_565 = readmatrix('15_RNA_57C_565.txt');
RNA_57C_647 = readmatrix('15_RNA_57C_647.txt');

RNA_66C_488 = readmatrix('15_RNA_65C_488.txt');
RNA_66C_565 = readmatrix('15_RNA_65C_565.txt');
RNA_66C_647 = readmatrix('15_RNA_65C_647.txt');

RNA_74C_488 = readmatrix('15_RNA_72C_488.txt');
RNA_74C_565 = readmatrix('15_RNA_72C_565.txt');
RNA_74C_647 = readmatrix('15_RNA_72C_647.txt');

RNA_copy_per_cell = [];
RNA_copy_per_cell(end+1,:) = size(RNA_39C_488,1);
RNA_copy_per_cell(end+1,:) = size(RNA_39C_565,1);
RNA_copy_per_cell(end+1,:) = size(RNA_39C_647,1);

RNA_copy_per_cell(end+1,:) = size(RNA_48C_488,1);
RNA_copy_per_cell(end+1,:) = size(RNA_48C_565,1);
RNA_copy_per_cell(end+1,:) = size(RNA_48C_647,1);

RNA_copy_per_cell(end+1,:) = size(RNA_57C_488,1);
RNA_copy_per_cell(end+1,:) = size(RNA_57C_565,1);
RNA_copy_per_cell(end+1,:) = size(RNA_57C_647,1);

RNA_copy_per_cell(end+1,:) = size(RNA_66C_488,1);
RNA_copy_per_cell(end+1,:) = size(RNA_66C_565,1);
RNA_copy_per_cell(end+1,:) = size(RNA_66C_647,1);

RNA_copy_per_cell(end+1,:) = size(RNA_74C_488,1);
RNA_copy_per_cell(end+1,:) = size(RNA_74C_565,1);
RNA_copy_per_cell(end+1,:) = size(RNA_74C_647,1);

close all;

RNA_target_name = {'ARID1A','ARHGEF28','BAZ1B',...
       'DGKD','ELAVL1','EGFR',...
       'FOSL2','FNDC3B','HEG1',...
       'NCOR1','KIF1C','ITPR3',...
       'APC','POGK','NUP205'};

color_Set = [0 0 0.8;
             0 0.8 0;
             0.8 0 0;
             0.3 0 0.7;
             0.3 0.7 0.7;
             0.7 0.3 0.7;
             0.3 0.8 0.7;
             0.8 0.8 0.7;
             0.1 0.4 0.7;
             0.3 0.8 0.1;
             0.1 0.4 0.1;
             0.8 0.4 0.1;
             0.6 0.2 0.1;
             0.2 0.8 0.7;
             0.6 0.4 0.3;];

hold on;

b = bar(RNA_copy_per_cell,'FaceColor','flat');
xticks([1:15])
xticklabels(RNA_target_name)
xtickangle(45)
b.CData = color_Set;

set(gca,'linewidth',2);

%xtickangle(45);
set(gca,'fontsize',16);
ylabel('RNA copy per cell');
box on;

puncta_size = 16;
colors = distinguishable_colors(15,'k');

figure(10);
f = figure(10);
hold on;
x = scatter(RNA_39C_488(:,2),RNA_39C_488(:,1),puncta_size,'MarkerFaceColor',[0 0 0.9],'MarkerEdgeColor',[0 0 0.9]);
x = scatter(RNA_39C_565(:,2),RNA_39C_565(:,1),puncta_size,'MarkerFaceColor',[0 0.9 0],'MarkerEdgeColor',[0 0.9 0]);
x = scatter(RNA_39C_647(:,2),RNA_39C_647(:,1),puncta_size,'MarkerFaceColor',[0.9 0 0],'MarkerEdgeColor',[0.9 0 0]);

x = scatter(RNA_48C_488(:,2),RNA_48C_488(:,1),puncta_size,'MarkerFaceColor',[0.3 0 0.7],'MarkerEdgeColor',[0.3 0 0.7]);
x = scatter(RNA_48C_565(:,2),RNA_48C_565(:,1),puncta_size,'MarkerFaceColor',[0.3 0.7 0.7],'MarkerEdgeColor',[0.3 0.7 0.7]);
x = scatter(RNA_48C_647(:,2),RNA_48C_647(:,1),puncta_size,'MarkerFaceColor',[0.7 0.3 0.7],'MarkerEdgeColor',[0.7 0.3 0.7]);

x = scatter(RNA_57C_488(:,2),RNA_57C_488(:,1),puncta_size,'MarkerFaceColor',[0.3 0.9 0.7],'MarkerEdgeColor',[0.3 0.9 0.7]);
x = scatter(RNA_57C_565(:,2),RNA_57C_565(:,1),puncta_size,'MarkerFaceColor',[0.9 0.9 0.7],'MarkerEdgeColor',[0.9 0.9 0.7]);
x = scatter(RNA_57C_647(:,2),RNA_57C_647(:,1),puncta_size,'MarkerFaceColor',[0.1 0.4 0.7],'MarkerEdgeColor',[0.1 0.4 0.7]);

x = scatter(RNA_66C_488(:,2),RNA_66C_488(:,1),puncta_size,'MarkerFaceColor',[0.3 0.9 0.1],'MarkerEdgeColor',[0.3 0.9 0.1]);
x = scatter(RNA_66C_565(:,2),RNA_66C_565(:,1),puncta_size,'MarkerFaceColor',[0.1 0.9 0.1],'MarkerEdgeColor',[0.1 0.9 0.1]);
x = scatter(RNA_66C_647(:,2),RNA_66C_647(:,1),puncta_size,'MarkerFaceColor',[0.9 0.4 0.1],'MarkerEdgeColor',[0.9 0.4 0.1]);

x = scatter(RNA_74C_488(:,2),RNA_74C_488(:,1),puncta_size,'MarkerFaceColor',[0.6 0.2 0.1],'MarkerEdgeColor',[0.6 0.2 0.1]);
x = scatter(RNA_74C_565(:,2),RNA_74C_565(:,1),puncta_size,'MarkerFaceColor',[0.8 0.9 0.7],'MarkerEdgeColor',[0.8 0.9 0.7]);
x = scatter(RNA_74C_647(:,2),RNA_74C_647(:,1),puncta_size,'MarkerFaceColor',[0.6 0.4 0.3],'MarkerEdgeColor',[0.6 0.4 0.3]);


legend('ARID1A','ARHGEF28','BAZ1B',...
       'DGKD','ELAVL1','EGFR',...
       'FOSL2','FNDC3B','HEG1',...
       'NCOR1','KIF1C','ITPR3',...
       'APC','POGK','NUP205');
legend boxoff;
   
set(gca,'fontsize',20)

xlim([1 512]);
ylim([1 512]);
set(gca,'YDir','reverse');
set(gca,'Color','k');
set(gca,'xtick',[]);
set(gca,'ytick',[]);
axis square;
%set(gca,'visible','off')
f.Position = [100 100 1000 600];
print(10,'-depsc','15_RNA_reconstruction.eps');
