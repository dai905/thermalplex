temperature_set = [25:5:70];

spot_number_set = [];

for c1 = 1:size(temperature_set,2)
    
    cur_temp = temperature_set(c1);
    data_file_name = sprintf('processed_image/APC_p15nt_%dC_puncta_location.txt',cur_temp);
    spot = readtable(data_file_name);
    
    spot_number_set(end+1) = size(spot,1);
   
end

close all;
figure(1);
hold on;
maker_plot = plot(temperature_set,spot_number_set,'o','markersize',6,'linewidth',2);
plot(temperature_set,spot_number_set,'linewidth',2);
set(gca,'fontsize',24);
xlabel('Temperature (^oC)');
ylabel('Number of Puncta');
xlim([20 80]);
ylim([0 220]);
axis square
box on;

print(1,'-depsc','APC_15nt_probe_temp_vs_number.eps')
