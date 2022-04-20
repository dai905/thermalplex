for c1 = 1:6
    
cell_name = sprintf('cell%d',c1);
Temperature = '48C';
Sample = 'heating20s';

mkdir(sprintf('%s/single_cell_RNA_counts/%s',Temperature,Sample));
cell_mask = ReadImage(sprintf('Cellmask/%s.tiff',cell_name),1)>120;

sample_folder = sprintf('%s/%s',Temperature,Sample);

%% Processing 488 channel
sample_name = sprintf('%s/%s/*_a.tiff',Temperature,Sample);
sample_image_name = dir(sample_name);

file_name = sprintf('%s/%s',sample_folder,sample_image_name.name);
images = ReadImage(file_name,1);

boxsize = 4;
bg_filter = 20;
intensity_filter = 50; % set the intensity parameter to identify the spot

% filter the background
tophatFiltered_image =filterimage(images,bg_filter);
masked_images  = double(tophatFiltered_image).*cell_mask;

% find the puncta
puncta_location = FindSpotMasked(masked_images,boxsize,intensity_filter);

% get the puncta on the images
figure(1);
imagesc(images);
colormap(gray)
axis equal;
%showSpot(puncta_location(:,1:2),boxsize);
caxis([50 200])
colorbar;
set(gca,'fontsize',16);
set(gca,'visible','off');
%print(1,'-depsc',sprintf('15_RNA_%s_488.eps',Temperature));
%print(1,'-r300','-djpeg',sprintf('15_RNA_%s_488.jpeg',Temperature));

figure(2);
imagesc(images);
colormap(gray)
axis equal;
caxis([50 200])
colorbar;
set(gca,'visible','off')
if ~isempty(puncta_location)
    showSpot(puncta_location(:,1:2),boxsize);
    writematrix(puncta_location,sprintf('%s/single_cell_RNA_counts/%s/%s_15_RNA_647.txt',Temperature,Sample,cell_name))
    print(2,'-r300','-djpeg',sprintf('single_cell_RNA_counts/%s_15_RNA_%s_647.jpeg',cell_name,Temperature));

else
    writematrix(puncta_location,sprintf('%s/single_cell_RNA_counts/%s/%s_15_RNA_647.txt',Temperature,Sample,cell_name))
 
end

% % get the intensity distribution of the puncta
if ~isempty(puncta_location)
    figure(3);
    histogram(puncta_location(:,3),50)
    set(gca,'fontsize',24);
    xlabel('spot intensity');
    ylabel('Counts');
else
end

end
