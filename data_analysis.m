close all;
file_name = 'original_data/MAX_Melt_96_648_with_8uL.tif';
images = ReadImage(file_name,1);

boxsize = 20;
bg_filter = 20;
intensity_filter = 120;

% 
% tophatFiltered_image =filterimage(images,10);
% showimage(tophatFiltered_image);
% caxis([50 400])
% axis square;

puncta_location = FindSpot(file_name,boxsize,bg_filter,intensity_filter);


showimage(images);
caxis([100 1500])
colorbar;
axis square;

gethist(images)

