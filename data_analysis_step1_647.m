Temperature = '72C';
Sample = 'position3_72C';
sample_folder = sprintf('%s/%s',Temperature,Sample);

sample_name = sprintf('%s/%s/*_d.tiff',Temperature,Sample);
sample_image_name = dir(sample_name);

file_name = sprintf('%s/%s',sample_folder,sample_image_name.name);
images = ReadImage(file_name,1);

boxsize = 4;
bg_filter = 10;
intensity_filter = 60; % set the intensity parameter to identify the spot

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
caxis([110 290])
colorbar;
set(gca,'fontsize',16);
set(gca,'visible','off')
print(1,'-depsc',sprintf('15_RNA_%s_647.eps',Temperature))

figure(2);
imagesc(images);
colormap(gray)
axis equal;
caxis([100 300])
colorbar;
set(gca,'visible','off')
if ~isempty(puncta_location)
    showSpot(puncta_location(:,1:2),boxsize);
    writematrix(puncta_location,sprintf('15_RNA_%s_647.txt',Temperature))
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

