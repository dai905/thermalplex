function [temperature_set,yield_set] = getYeildFromTemp(Melting_Temp)

    %Melting_Temp = 60;

    seq_para = readmatrix('seq_para_set3.txt');
    x2 = seq_para(:,4);
    y1 = seq_para(:,5);
    P = polyfit(x2,y1,1);
    Melting_width = Melting_Temp*P(1)+P(2);

    gausin_function = @(x) exp(-(x-Melting_Temp).^2/(Melting_width).^2);

    temperature_set = [10:0.1:100];
    signal_set = [];

    for c1 = 1:length(temperature_set)

        temperature = temperature_set(c1);
        signal_set(end+1) = integral(gausin_function,10,temperature);

    end

    yield_set = (signal_set-min(signal_set))./(max(signal_set)-min(signal_set));

end