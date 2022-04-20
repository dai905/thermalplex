Temperature = '57C';
Sample = 'heating5s';
sample_folder = sprintf('%s/%s',Temperature,Sample);
sample_name = sprintf('%s/%s/%s_a.tiff',Temperature,Sample,Sample);
sample_image_name = dir(sample_name);

images = ReadImage(sample_name,1);

boxsize = 3;
bg_filter = 20;
intensity_filter = 60;
tophatFiltered_image =filterimage(images,bg_filter);
binary_image = tophatFiltered_image>intensity_filter;

bg_filter = 10;
intensity_filter = 40; % set the intensity parameter to identify the spot

figure(1);
imagesc(images);
colormap(gray)
caxis([100 200])

figure(2);
imagesc(binary_image);
colormap(gray)

[index1,index2] = find(binary_image==1);
dot_location = [index1,index2];

puncta_set = {};

cluster = [];
cluster_index = [];

cluster_set = {};
puncta_location = [];
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
    
    cluster_set{end+1} = cluster;
    
    dot_location(cluster_index,:) = [];
    
    x_location = mean(cluster(:,1));
    y_location = mean(cluster(:,2));
    
    %Puncta_intensity = CalPunctaIntensity(cluster,images);
    spot_intensity = FindSpotIntensity([round(y_location),round(x_location)],images);

    puncta_location(end+1,:) = [round(x_location),round(y_location),double(Puncta_intensity)];
    
    rectangle('Position',[y_location-boxsize/2,x_location-boxsize/2,boxsize,boxsize],'EdgeColor','r')
       
end