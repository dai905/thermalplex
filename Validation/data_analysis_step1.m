Temperature = '57C';
Sample = 'sample12_2';

sample_folder = sprintf('%s/%s',Temperature,Sample);
sample_name_565 = sprintf('%s/%s/%s_a.tiff',Temperature,Sample,Sample);
sample_name_647 = sprintf('%s/%s/%s_b.tiff',Temperature,Sample,Sample);

images_647 = ReadImage(sample_name_647,1);
images_565 = ReadImage(sample_name_565,1);

boxsize = 4;
bg_filter = 6;

% find the puncta for 565
intensity_filter_565 = 230; % set the intensity parameter to identify the spot
tophatFiltered_image_565 =filterimage(images_565,bg_filter);
puncta_location_565 = FindSpot2(sample_name_565,boxsize,bg_filter,intensity_filter_565);
writematrix(puncta_location_565,sprintf('%s_565_puncta_info.txt',sample_folder))

% find the puncta for 647
intensity_filter_647 = 30;
tophatFiltered_image_647 =filterimage(images_647,bg_filter);
puncta_location_647 = FindSpot2(sample_name_647,boxsize,bg_filter,intensity_filter_647);
writematrix(puncta_location_647,sprintf('%s_647_puncta_info.txt',sample_folder))

% get the puncta on the images
% figure(4);
% histogram(images,70);
%
close all;
% figure(1);
% imagesc(images_565);
% colormap(gray)
% axis equal;
% showSpot(puncta_location_565(:,1:2),boxsize);
% caxis([150 400])
% colorbar;
% set(gca,'fontsize',16);
% set(gca,'visible','off')

figure(5);
imagesc(images_647);
colormap(gray)
axis equal;

figure(6);
background_image = zeros(512,512);

for c1 = size(puncta_location_647,1)
    puncat_info = puncta_location_647(c1,1:2);
    background_image(puncat_info) = 1;
end
imagesc(background_image);

figure(2);
imagesc(images_647);
colormap(gray)
axis equal;
showSpot(puncta_location_647(:,1:2),boxsize);
caxis([110 200])
colorbar;
set(gca,'fontsize',16);
set(gca,'visible','off')

figure(4);
histogram(images_647,70);
axis square;
set(gca,'fontsize',24);
xlabel('spot intensity');
ylabel('Counts');
xlim([0 1000]);

figure(3);
if ~isempty(puncta_location)
    showSpot(puncta_location(:,1:2),boxsize);
else
end

% % get the intensity distribution of the puncta
if ~isempty(puncta_location)
    figure(3);
    histogram(puncta_location(:,3),20)
    set(gca,'fontsize',24);
    xlabel('spot intensity');
    ylabel('Counts');
    xlim([0 1000]);
    axis square;
else
end