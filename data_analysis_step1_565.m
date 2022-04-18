Temperature = '39C';
Sample = 'position3_2';
sample_folder = sprintf('%s/%s',Temperature,Sample);

%% Processing 488 channel
sample_name = sprintf('%s/%s/*_c.tiff',Temperature,Sample);
sample_image_name = dir(sample_name);

file_name = sprintf('%s/%s',sample_folder,sample_image_name.name);
images = ReadImage(file_name,1);

boxsize = 4;
bg_filter = 10;
intensity_filter = 50; % set the intensity parameter to identify the spot

% filter the background
tophatFiltered_image =filterimage(images,bg_filter);
% find the puncta
puncta_location = FindSpot(file_name,boxsize,bg_filter,intensity_filter);

% get the puncta on the images
figure(1);
imagesc(images);
colormap(gray)
axis equal;
showSpot(puncta_location(:,1:2),boxsize);
caxis([110 170])
colorbar;
set(gca,'fontsize',16);
set(gca,'visible','off')
print(1,'-depsc',sprintf('15_RNA_%s_565.eps',Temperature))
print(1,'-r300','-djpeg',sprintf('15_RNA_%s_565.jpeg',Temperature));

figure(2);
imagesc(images);
colormap(gray)
axis equal;
caxis([100 200])
colorbar;
set(gca,'visible','off')
if ~isempty(puncta_location)
    %showSpot(puncta_location(:,1:2),boxsize);
    writematrix(puncta_location,sprintf('15_RNA_%s_565.txt',Temperature))

else
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

