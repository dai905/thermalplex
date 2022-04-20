function filtered_puncta_info = FindSpot2(file_name,boxsize,bg_filter,intensity_filter)

% file_name = '57C/sample12_2/sample12_2_a.tiff';
% boxsize = 5;
% bg_filter = 20; % set the intensity to filter the background
% intensity_filter = 200; % set the intensity parameter to identify the spot

puncta_location = [];
images = ReadImage(file_name,1);
tophatFiltered_image =filterimage(images,bg_filter);
binary_image = tophatFiltered_image>intensity_filter;

%  imagesc(binary_image);
%  colormap(gray)

[index1,index2] = find(binary_image==1);
dot_location = [index1,index2];

puncta_set = {};

cluster = [];
cluster_index = [];

while size(dot_location,1) ~= 0
    
    %fprintf('dot_location_size = %d\n',size(dot_location,1));
    %for c1 = 1
    
    cluster = [];
    cluster_index = [];
    dot_x = dot_location(1,1);
    dot_y = dot_location(1,2);
    
    cluster(end+1,:) = [dot_x,dot_y];
    cluster_index(end+1) = 1;
    
    for c2 = 2:size(dot_location,1)
                    
            dot_xx = dot_location(c2,1);
            dot_yy = dot_location(c2,2);        

            diff_x = abs(dot_xx-dot_x);
            diff_y = abs(dot_yy-dot_y);
            if diff_x < boxsize && diff_y < boxsize
               %fprintf('%d , x_distance = %d, y_distance = %d \n',c2,diff_x,diff_y);
               cluster_index(end+1) = c2; 
               cluster(end+1,:) = [dot_xx,dot_yy];
            end
        end

    
    dot_location(cluster_index,:) = [];
    
    x_location = mean(cluster(:,1));
    y_location = mean(cluster(:,2));
    puncta_size = size(cluster,1);
    spot_intensity = FindSpotIntensity([round(y_location),round(x_location)],images);

    puncta_location(end+1,:) = [round(x_location),round(y_location),spot_intensity,puncta_size];
    
    %rectangle('Position',[y_location-boxsize/2,x_location-boxsize/2,boxsize,boxsize],'EdgeColor','r')     
end

% filter the puncta size
filtered_puncta_info = [];
for c1 = 1:size(puncta_location,1)
    cur_puncta_size = puncta_location(c1,4);
    
    if cur_puncta_size > 1
       filtered_puncta_info(end+1,:) = puncta_location(c1,:);
    else
    end
    
    
end

% 
% figure(1);
% imagesc(images);
% colormap(gray)
% axis equal;
% showSpot(filtered_puncta_info(:,1:2),boxsize);
% caxis([200 400])
% colorbar;
% set(gca,'fontsize',16);
% set(gca,'visible','off')
% axis equal
