parameters = readmatrix('seq_para_set3.txt');
Temperature = [20:4:90];

data_set = {};

for c1 = 1:5:30

    quncher_para = parameters(c1,:);    
    Temperature_binding_siangl = [];    
    Binding_lables = {};
    
    for c2 = 1:20
        
        binding_para = parameters(c2,:);
        Binding_lables(end+1) = {sprintf('%d',binding_para(1))};
        temperature_lables = {};
        
        for c3 = 1:length(Temperature)
            
            cur_temp = Temperature(c3);
            temperature_lables(end+1) = {sprintf('%d',cur_temp)};
            bindig_melting_yield = GetMeltingYield(quncher_para(2),quncher_para(3),cur_temp);
            quncher_melting_yield = GetMeltingYield(binding_para(2),binding_para(3),cur_temp);

            signal = quncher_melting_yield*(1-bindig_melting_yield);
            Temperature_binding_siangl(c2,c3) = signal;      
        end
    end 
    data_set(end+1,:) = {quncher_para(1),Temperature_binding_siangl};
end

close all;

for c5 = 1:size(data_set,1)
    
    quncher_length = data_set{c5,1};
    binding_probe_singal = data_set{c5,2};
    figure(c5);
    imagesc(binding_probe_singal);
    colorbar;
    title(sprintf('Quncher Region Length %d-nt',quncher_length));
    %xticklabels(temperature_lables);
    %yticklabels(Binding_lables);
    xlabel('Temperature');
    ylabel('Binding Region Length(nt)');
    set(gca,'fontsize',16);

    %print(c5,'-dpng','-r600',sprintf('Temp_%d_yiead.png',c5));
end



