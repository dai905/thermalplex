Temperature = '39C';
Sample = 'position3_2';
sample_folder = sprintf('%s/%s',Temperature,Sample);

%% load the orignal image
sample_name = sprintf('%s/%s/*_b.tiff',Temperature,Sample);
sample_image_name = dir(sample_name);

file_name = sprintf('%s/%s',sample_folder,sample_image_name.name);
images = ReadImage(file_name,1);


figure(1);
imshow(images);
caxis([0 400])
title('Original Image');


%% Detect the cells
[~,threshold] = edge(images,'sobel');
fudgeFactor = 0.5;
BWs = edge(images,'sobel',threshold * fudgeFactor);

figure(2);
imshow(BWs)
title('Binary Gradient Mask')

%% Dilate the image
se90 = strel('line',3,90);
se0 = strel('line',3,0);

BWsdil = imdilate(BWs,[se90 se0]);
figure(3);
imshow(BWsdil)
title('Dilated Gradient Mask')

%% fill interior Gaps

BWdfill = imfill(BWsdil,'holes');
figure(4)
imshow(BWdfill)
title('Binary Image with Filled Holes')