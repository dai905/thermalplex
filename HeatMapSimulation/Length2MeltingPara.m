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
    
    
     
    hold on;
    figure(1);
    plot(Temp_set,normalize(yield_set,'range'));

    yield_derive = diff(yield_set);
    %plot(Temp_set(2:end),yield_derive);
    yield_der_norm = normalize(yield_derive);
    plot(Temp_set(2:end),normalize(yield_derive,'range'));
    box on;
    x = Temp_set(2:end);
    y = yield_derive;
    f = fit(x.',y.','gauss1');
    
    Melting_para(end+1,:) = [length f.b1 f.c1];

end
