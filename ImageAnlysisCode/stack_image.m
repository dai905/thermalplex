Temperature = 'RT';
sample_name = '20210907_Melt_Q20';
file_name = sprintf('%s/%s/%s_MMStack_Default.ome.tif',Temperature,sample_name,sample_name);
%file_name = 'RT/20210907_Melt_Q15/20210907_Melt_Q17_MMStack_Default.ome.tif';

% stack the image
image_647 = ReadImage(file_name,1);
imagesc(image_647);

for c1 = 3:2:21

    image_647 = image_647 + ReadImage(file_name,c1);
    
end

image_402 = ReadImage(file_name,2);

for c2 = 2:2:22

    image_402 = image_402 + ReadImage(file_name,c2);
    
end

%% Set the image processing parameter
boxsize = 5;
bg_filter = 10;
intensity_filter = 200;
%% plot the image channel 647
close all;
tophatFiltered_image647 =filterimage(image_647,bg_filter);
puncta_location = FindSpot(image_647,boxsize,bg_filter,intensity_filter);
    
figure(1);
imagesc(tophatFiltered_image647);
colormap(gray);
caxis([200 2000])

%% plot the image channel 402

figure(2);
tophatFiltered_image402 =filterimage(image_402,bg_filter);
imagesc(tophatFiltered_image402);
colormap(gray);
caxis([900 2000])
