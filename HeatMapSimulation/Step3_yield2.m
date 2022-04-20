parameters = readmatrix('seq_para_set3.txt');

Quncher_Tm_set = [35:1:75];
Binding_Tm_set = [40:1:80]; 

Temperature_yield = [];

for c1 = 1:length(Quncher_Tm_set)
    
    Quncher_Tm = Quncher_Tm_set(c1);
    
    for c2 = 1:length(Binding_Tm_set)
        fprintf('working on quncher %d binding %d \n',c1,c2);
        Binding_Tm = Binding_Tm_set(c2);
        
        [temperature_set,quncher_yield_set] = getYeildFromTemp(Quncher_Tm);
        [temperature_set,binding_yield_set] = getYeildFromTemp(Binding_Tm);

        binding_yield_set = 1- binding_yield_set;
        
        thermal_spectrum = binding_yield_set.*quncher_yield_set;
        
        Temperature_yield(c1,c2) = max(thermal_spectrum);
    end
         
end

writematrix(Temperature_yield,'Heatmap_Yield_2.txt');

imagesc(Temperature_yield);
colormap('jet');
colorbar;





