time_Set = 5:5:30;

full_data_set = [];
heating_name = {};
temperature = 65;

close all;

figure(1);
hold on;
mean_value = [];

bg = 115;

for c1 = 1:length(time_Set)
    
    time = time_Set(c1);
    file_name = sprintf('%dC/puncta_location_info_%dC_heating%ds.txt',temperature,temperature,time);
    heating_data = readmatrix(file_name);
 
    intensity_data = [];
    for c2 = 1:size(heating_data,1)
        
        x_data = normrnd(time,0.6);
        intensity_data(end+1,:) = [x_data,heating_data(c2,3)];
        
    end
    mean_value = mean(heating_data(:,3));
    scatter(intensity_data(:,1),intensity_data(:,2),5,...
            'MarkerFaceColor',[0 0 0.5],'MarkerEdgeColor',[0 0 0.5])%,...
            %'MarkerFaceAlpha',0.2,'MarkerEdgeAlpha',0.2);
    
    line([time-2;time+2],[bg;bg],'color',[0.5 0.5 0.5],'linewidth',1);            
    line([time-2;time+2],[mean_value;mean_value],'color','r','linewidth',1);
end

ylim([100 300]);
xlim([0 35]);
xticks([0:5:30]);

xlabel('Heating Time (s)');
ylabel('Puncta Signal Intensity');
set(gca,'fontsize',24);
axis square;
box on;
print(1,'-depsc',sprintf('%d_heating.eps',temperature));