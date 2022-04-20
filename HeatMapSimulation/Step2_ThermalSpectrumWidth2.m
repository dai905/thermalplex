parameters = readmatrix('seq_para_set3.txt');

Quncher_Tm_set = [35:1:75];
Binding_Tm_set = [40:1:80]; 

Temperature_width = [];

for c1 = 1:length(Quncher_Tm_set)
    
    Quncher_Tm = Quncher_Tm_set(c1);
    
    parfor c2 = 1:length(Binding_Tm_set)
        
        fprintf('working on quncher %d:%d binding %d: %d \n',c1,Quncher_Tm_set(c1),c2,Binding_Tm_set(c2));

        Binding_Tm = Binding_Tm_set(c2);
        
        [temperature_set,quncher_yield_set] = getYeildFromTemp(Quncher_Tm);
        [temperature_set,binding_yield_set] = getYeildFromTemp(Binding_Tm);

        binding_yield_set = 1- binding_yield_set;
        
        thermal_spectrum = binding_yield_set.*quncher_yield_set;

        thermal_spectrum_norm = normalize(thermal_spectrum,'range');
        plot(temperature_set,thermal_spectrum_norm);
        
        compare_half = abs(thermal_spectrum_norm-0.5);
        reverse = 1-compare_half;
        
        [pks,locs] = findpeaks(reverse,'MinPeakDistance',20);
                
        melting_width = temperature_set(locs(2))-temperature_set(locs(1));
        Temperature_width(c1,c2) = melting_width;
       
    end    
end


writematrix(Temperature_width,'Heatmap_ThermalWidth_2.txt');
imagesc(Temperature_width);
colormap('jet');
colorbar;
set(gca,'fontsize',20);

