parameters = readmatrix('seq_para_set3.txt');

Quncher_Tm_set = [35:1:75];
Binding_Tm_set = [40:1:80]; 

Temp_set = [];

for c1 = 1:length(Quncher_Tm_set)
    
    Quncher_Tm = Quncher_Tm_set(c1);

    parfor c2 = 1:length(Binding_Tm_set)
        fprintf('working on quncher %d binding %d \n',c1,c2);
        Binding_Tm = Binding_Tm_set(c2);
        
        [temperature_set,quncher_yield_set] = getYeildFromTemp(Quncher_Tm);
        [temperature_set,binding_yield_set] = getYeildFromTemp(Binding_Tm);

        binding_yield_set = 1- binding_yield_set;
        
        thermal_spectrum = binding_yield_set.*quncher_yield_set;
        %figure();
        %plot(temperature_set,thermal_spectrum);
        
        [pks,locs] = findpeaks(thermal_spectrum,'MinPeakDistance',20);
        peak_temperature = temperature_set(locs(1));
        %Temperature_yield(c1,c2) = max(thermal_spectrum);        
        %Tm_index = find(thermal_spectrum==max(thermal_spectrum));
        %Tm = temperature_set(Tm_index(1));
        Temp_set(c1,c2) = peak_temperature;
        
    end
      
end

writematrix(Temp_set,'Heatmap_SignalTm_2.txt');

figure(5);
imagesc(Temp_set);
colormap('jet');
colorbar;




