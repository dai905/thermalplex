function puncta_location = FindSpot(file_name,boxsize,bg_filter,intensity_filter)

% file_name = 'Original_data/MAX_20210620_APC_p15nt_25C.tif';
% boxsize = 15;
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
    spot_intensity = FindSpotIntensity([round(y_location),round(x_location)],images);

    puncta_location(end+1,:) = [round(x_location),round(y_location),spot_intensity];
    
    %rectangle('Position',[y_location-boxsize/2,x_location-boxsize/2,boxsize,boxsize],'EdgeColor','r')
       
end

axis equal
