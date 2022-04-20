function [] = showSpot(puncta_location,boxsize)

for c1 = 1:size(puncta_location,1)
    x_location = puncta_location(c1,1);
    y_location = puncta_location(c1,2);
    puncta_location(end+1,:) = [x_location,y_location];
    rectangle('Position',[y_location-boxsize/2,x_location-boxsize/2,boxsize,boxsize],'EdgeColor','r','LineWidth',0.7)
    
end
