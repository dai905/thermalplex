Temperature = '57C';
Sample = 'ThermP3';

sample_folder = sprintf('%s/%s_%s',Temperature,Sample,Temperature);
sample_name = sprintf('%s/%s_%s/*_a.tiff',Temperature,Sample,Temperature);
sample_image_name = dir(sample_name);

file_name = sprintf('%s/%s',sample_folder,sample_image_name.name);
images = ReadImage(file_name,1);

boxsize = 15;file_name = sprintf('%s/%s',sample_folder,sample_image_name.name);
images = ReadImage(file_name,1);

boxsize = 5;
bg_filter = 10;
intensity_filter = 50; % set the intensity parameter to identify the spot

% filter the background
tophatFiltered_image =filterimage(images,bg_filter);
% find the puncta
puncta_location = FindSpot(file_name,boxsize,bg_filter,intensity_filter);
%mean(puncta_location(:,3))

writematrix(puncta_location,sprintf('%s_puncta_info.txt',sample_folder))

% get the puncta on the images
figure(4);
histogram(images,70);
axis square;



figure(1);
imagesc(images);
colormap(gray)
axis equal;
%showSpot(puncta_location(:,1:2),boxsize);
caxis([100 200])
colorbar;
set(gca,'fontsize',16);
set(gca,'visible','off')
axis square;

figure(2);
imagesc(images);
colormap(gray)
axis equal;
caxis([100 200])
colorbar;
set(gca,'visible','off')
if ~isempty(puncta_location)
    showSpot(puncta_location(:,1:2),boxsize);
else
end

% % get the intensity distribution of the puncta
if ~isempty(puncta_location)
    figure(3);
    histogram(puncta_location(:,3),70)
    set(gca,'fontsize',24);
    xlabel('spot intensity');
    ylabel('Counts');
else
end
axis square;