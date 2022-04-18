close all;

n = 1;
for c1 = 1:4:81
 
    images = ReadImage('39C/position3_2/position3_2_MMStack_Default.ome.tif',c1);
    cellmask = ReadImage('Cell_mask/3D_cellmask.tiff',1)>115;
    I2 = imcrop(grayImage,[115, 89, 161-115,142-89]);
    images_selected = double(images).*cellmask;
    [index_a,index_b] = find(cellmask==1);
    
    crop_image = [];
    
    for c1 = 1:length(index_a)
        
        for c2 = 1:length(index_b)
            
            crop_image(c1,c2) = images(index_a(c1),index_b(c1));
            
        end
        
    end
    
    figure(n);
    n = n+1;
    imagesc(images_selected);
    colormap(gray)
    caxis([100 200]);
    newmap = gray;              
    newmap(:,3) = 0;
    newmap(:,2) = 0;
    colormap(newmap);
    axis square;

end

figure()
imagesc(cellmask)

% caxis([50 300])
% 
% figure(2);
% vol3d('CData',squeeze(image_3D),'texture','3D');
% 
% view(3);  
% colormap(gray);
% caxis([100 200]);
% set(gca,'Color','k');
% daspect([20 20 1]);
