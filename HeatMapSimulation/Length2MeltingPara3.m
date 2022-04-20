% https://web.nmsu.edu/~snsm/classes/chem435/Lab4/

parameters = readmatrix('seq_para_set3.txt');

Melting_para = [];
close all;

for c1 = 1:size(parameters,1)
    
    length = parameters(c1,1);
    dH_mean = parameters(c1,2);
    dS_mean = parameters(c1,3);
    
    Temp_set = [10:0.1:100];
    yield_set = GetMeltingCurve(Temp_set,dH_mean,dS_mean);
    
    low_temp_yield = abs(yield_set-0.1);
    high_temp_yield = abs(yield_set-0.9);
    
    low_temp_compare = low_temp_yield==min(low_temp_yield);
    high_temp_compare = high_temp_yield==min(high_temp_yield);
    
    low_temp_index = find(low_temp_compare==1);
    high_temp_index = find(high_temp_compare==1);
    
    low_temp = Temp_set(low_temp_index);
    high_temp = Temp_set(high_temp_index);
    melting_temp = (low_temp+high_temp)/2;
    melting_half_width = high_temp - melting_temp;
    Melting_para(end+1,:) = [length melting_temp melting_half_width];
    
    
    hold on;
    figure(1);
    plot(Temp_set,normalize(yield_set,'range'));

end

writematrix(Melting_para,'melting_para_set3.txt');
