Temperature = '57C';
Sample = 'heating20s';
sample_folder = sprintf('%s/%s',Temperature,Sample);
sample_name = sprintf('%s/%s/*_a.tiff',Temperature,Sample);
sample_image_name = dir(sample_name);

file_name = sprintf('%s/%s',sample_folder,sample_image_name.name);
images = ReadImage(file_name,1);

boxsize = 15;file_name = sprintf('%s/%s',sample_folder,sample_image_name.name);
images = ReadImage(file_name,1);

boxsize = 4;
bg_filter = 10;
intensity_filter = 50; % set the intensity parameter to identify the spot

% filter the background
tophatFiltered_image =filterimage(images,bg_filter);
% find the puncta
puncta_location = FindSpot2(file_name,boxsize,bg_filter,intensity_filter);
cd(Temperature);
writematrix(puncta_location,sprintf('puncta_location_info_%s_%s.txt',Temperature,Sample));
cd ..;
histogram(puncta_location(:,3),20);

%% plot the raw images
figure(1);
imagesc(images);
mean(images);
colormap(gray);
axis equal;
caxis([50 300]);
colorbar;
set(gca,'visible','off');
print(1,'-depsc',sprintf('%s/raw_image.eps',sample_folder));
%% plot the image with puncta box
figure(2);
imagesc(images);
colormap(gray)
axis equal;
caxis([50 300])
colorbar;
set(gca,'visible','off')
if ~isempty(puncta_location)
    showSpot(puncta_location(:,1:2),boxsize);
else
end
print(2,'-depsc',sprintf('%s/raw_image_with_puncta.eps',sample_folder));
%%
% % get the intensity distribution of the puncta
if ~isempty(puncta_location)
    figure(3);
    histogram(puncta_location(:,3),20)
    set(gca,'fontsize',24);
    xlabel('spot intensity');
    ylabel('Counts');
else
end
print(3,'-depsc',sprintf('%s/puncta_hist.eps',sample_folder));
