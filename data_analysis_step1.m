Temperature = '39C';
Sample = '39C_2_step_5um';
sample_folder = sprintf('%s/%s',Temperature,Sample);

%% Processing 488 channel
sample_name = sprintf('%s/%s/*_b.tiff',Temperature,Sample);
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
%showSpot(puncta_location(:,1:2),boxsize);
caxis([140 250])
colorbar;
set(gca,'fontsize',16);
set(gca,'visible','off')

figure(2);
imagesc(images);
colormap(gray)
axis equal;
caxis([100 300])
colorbar;
set(gca,'visible','off')
if ~isempty(puncta_location)
    showSpot(puncta_location(:,1:2),boxsize);
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

