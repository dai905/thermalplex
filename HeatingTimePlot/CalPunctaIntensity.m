function intensity_matrix = CalPunctaIntensity(location,box_size,images)

% x_location_center = 436;
% y_location_center= 487;
% box_size =3;
% 
% location = [round(y_location_center),round(x_location_center)];

x_location_center = location(1);
y_location_center = location(2);

Puncta_intensity = 0;

shift_size = floor(box_size/2)+1;

intensity_matrix = [];

for c1 = 1:3 
    
    x_shift = c1-shift_size;    
    x_location = round(x_location_center)+x_shift;
    
    for c2 = 1:3
        
        y_shift = c2-shift_size;        
        y_location = round(y_location_center)+y_shift;        
        curr_spot = cluster(c1,:);        
        intensity_matrix(c2,c1) = FindSpotIntensity([y_location,x_location],images);
        
    end
    
end
