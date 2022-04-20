puncta_647_info = readmatrix('57C/sample12_2_647_puncta_info.txt');
puncta_565_info = readmatrix('57C/sample12_2_565_puncta_info.txt');

non_overlap_location_647 = [];
non_overlap_location_565 = [];
overlap_location_647_565= [];

puncta_647_location_set = puncta_647_info(:,1:2);
puncta_565_location_set = puncta_565_info(:,1:2);

for c1 = 1:size(puncta_647_location_set,1)
    
    puncta_647_location = puncta_647_location_set(c1,1:2);
    
    distance_with_565_set = puncta_647_location-puncta_565_location_set;
    
    distance_with_565_set_square = sum(distance_with_565_set.^2,2);
    
    overlap_index = find(distance_with_565_set_square==min(distance_with_565_set_square));
    
    if distance_with_565_set_square(overlap_index) <4
        
       overlap_location_647_565(end+1,:) = [c1,overlap_index];
       
    else
    end
   
end

non_overlap_location_647 = puncta_647_info;
overlaped_647_index = overlap_location_647_565(:,1);
non_overlap_location_647(overlaped_647_index,:) = [];

non_overlap_location_565 = puncta_565_info;
overlaped_565_index = overlap_location_647_565(:,2);
non_overlap_location_565(overlaped_565_index,:) = [];

writematrix(overlap_location_647_565,'57C/overlaped_puncta.txt');
xlswrite('57C/overlaped_puncta.csv',overlap_location_647_565);
xlswrite('57C/non_overlap_location_565.csv',non_overlap_location_565);
xlswrite('57C/non_overlap_location_647.csv',non_overlap_location_647);

figure(1);
imagesc(images_565);
colormap(gray)
axis equal;
showSpot(non_overlap_location_565(:,1:2),boxsize);
caxis([150 400])
colorbar;
set(gca,'fontsize',16);
%set(gca,'visible','off')

figure(2);
imagesc(images_647);
colormap(gray)
axis equal;
showSpot(non_overlap_location_647(:,1:2),boxsize);
caxis([110 200])
colorbar;
set(gca,'fontsize',16);
%set(gca,'visible','off')



fprintf('647 puncata size: %d, 565 puncata size: %d\n',...
         size(puncta_647_location_set,1),size(puncta_565_location_set,1));
fprintf('Overlap puncta size : %d \n',size(overlap_location_647_565,1));


% percentage_matrix = []; %565 647 overlap
% percentage_matrix(end+1,:) = [1 0.01 0.01]; % 48C
% percentage_matrix(end+1,:) = [1-size(overlap_location_647_565,1)/size(puncta_565_location_set,1),...
%                               size(overlap_location_647_565,1)/size(puncta_565_location_set,1),...
%                               1-size(overlap_location_647_565,1)/size(puncta_565_location_set,1)]; % 57C
% percentage_matrix(end+1,:) = [1 0.01 0.01]; % 65C
% figure(3);
% bar(percentage_matrix);
% ylim([0 1.05]);
% set(gca,'fontsize',24);
% ylabel('Percentage');
% xlabel('Temperatures');
% legend('565 Channel','Overlapped','647 Channel','location','Northwest');
% legend boxoff;
% set(gca,'XTickLabel',{'48 ^oC','57 ^oC','65 ^oC'});




