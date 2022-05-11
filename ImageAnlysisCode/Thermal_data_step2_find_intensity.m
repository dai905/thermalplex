% Load puncta information
clear all;
puncta_location = readmatrix('57C/puncta_location_info_57C_heating10s.txt');
puncta_intensity = [];
% load image

Temperature = '65C';
Sample = 'heating30s';
sample_folder = sprintf('%s/%s',Temperature,Sample);
sample_name = sprintf('%s/%s/*_a.tiff',Temperature,Sample);
sample_image_name = dir(sample_name);

file_name = sprintf('%s/%s',sample_folder,sample_image_name.name);
images = ReadImage(file_name,1);

new_puncta_location = [];

for c1 = 1:size(puncta_location,1)
    
    x_location = puncta_location(c1,1);
    y_location = puncta_location(c1,2);
    location = [y_location x_location];
    puncta_intensity(end+1,:) = FindSpotIntensity(location,images);
    new_puncta_location(end+1,:) = [x_location y_location FindSpotIntensity(location,images)];
end

writematrix(new_puncta_location,sprintf('%s/puncta_location_info_%s_%s.txt',Temperature,Temperature,Sample));


boxsize = 4;
bg_filter = 10;
intensity_filter = 40;

%% plot the raw images
figure(1);
imagesc(images);
colormap(gray);
axis equal;
caxis([100 300]);
colorbar;
set(gca,'visible','off');
print(1,'-depsc',sprintf('%s/raw_image.eps',sample_folder));
%% plot the image with puncta box
figure(2);
imagesc(images);
colormap(gray)
axis equal;
caxis([100 300])
colorbar;
set(gca,'visible','off')
if ~isempty(new_puncta_location)
    showSpot(new_puncta_location(:,1:2),boxsize);
else
end
print(2,'-depsc',sprintf('%s/raw_image_with_puncta.eps',sample_folder));
%%
% % get the intensity distribution of the puncta
if ~isempty(puncta_location)
    figure(3);
    histogram(new_puncta_location(:,3),20)
    set(gca,'fontsize',24);
    xlabel('spot intensity');
    ylabel('Counts');
else
end
print(3,'-depsc',sprintf('%s/puncta_hist.eps',sample_folder));
