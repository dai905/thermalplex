%% HeatingMap

heatmap_temp = readmatrix('Heatmap_ThermalWidth_2');
%heatmap_temp_fip = flip(readmatrix('Heatmap_ThermalWidth_2'));
figure(3);
imagesc(heatmap_temp);
colormap('jet');
a = colorbar;
a.Label.String = 'Thermal spectrum width (^oC)';

xticks_label = {};
yticks_label = {};
for c1 = 1:10:size(heatmap_temp,1)
    
    yticks_label{end+1} = num2str(c1+34);
end

for c2 = 1:10:size(heatmap_temp,2)
    xticks_label{end+1} = num2str(c2+39);

end

xticks([1:10:41]);
xticklabels(xticks_label);
yticks([1:10:41]);
yticklabels(yticks_label);
set(gca,'fontsize',22);
set(gca,'box','off');
title('Width')
xlabel('T_m of Binding Region (^oC)');
ylabel('T_m of Quncher Region (^oC)');
print(3,'-depsc','Heating_ChannelWidth.eps');

%% HeatingMap
heatmap_temp = readmatrix('Heatmap_Yield_2.txt');
%heatmap_temp_fip = flip(readmatrix('Heatmap_Yield_2.txt'));
figure(2);
imagesc(heatmap_temp);
colormap('jet');
a = colorbar;
a.Label.String = 'Yield';

xticks_label = {};
yticks_label = {};
for c1 = 1:10:size(heatmap_temp,1)
    
    yticks_label{end+1} = num2str(c1+34);
end

for c2 = 1:10:size(heatmap_temp,2)
    
    xticks_label{end+1} = num2str(c2+39);

end

xticks([1:10:41]);
xticklabels(xticks_label);
yticks([1:10:41]);
yticklabels(yticks_label);

set(gca,'fontsize',22);
xlabel('T_m of Binding Region (^oC)');
ylabel('T_m of Quncher Region (^oC)');
title('Yield')
print(2,'-depsc','Heating_Yield.eps');

%% HeatingMap
heatmap_temp = readmatrix('Heatmap_SignalTm_2.txt');
%heatmap_temp_fip = flip(readmatrix('Heatmap_SignalTm_2.txt'));
figure(1);
imagesc(heatmap_temp);
colormap('jet');
a = colorbar;
a.Label.String = 'Signal Temperature (^oC)';

xticks_label = {};
yticks_label = {};
for c1 = 1:10:size(heatmap_temp,1)
    
    yticks_label{end+1} = num2str(c1+34);
end

for c2 = 1:10:size(heatmap_temp,2)
    xticks_label{end+1} = num2str(c2+39);

end

xticks([1:10:41]);
xticklabels(xticks_label);
yticks([1:10:41]);
yticklabels(yticks_label);

set(gca,'fontsize',22);
xlabel('T_m of Binding Region (^oC)');
ylabel('T_m of Quncher Region (^oC)');
title('Signal Temperature');
print(1,'-depsc','Heating_Tem.eps');