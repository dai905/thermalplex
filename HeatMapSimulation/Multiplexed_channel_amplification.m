Probe_set_lib = {[35 40],[40,45],[45 50],[50,55],[55 60],[60 65],[65 70]}; % Binding Tm, Quncher Tm

close all;
for c1 = 1:length(Probe_set_lib)
    Probe_set = Probe_set_lib{c1};
    Tm_binding = Probe_set(1);
    Tm_quenching = Probe_set(2);

    [temperature_set,quncher_yield_set] = getYeildFromTemp(Tm_quenching);
    [temperature_set,binding_yield_set] = getYeildFromTemp(Tm_binding);
    binding_yield_set = 1- binding_yield_set;
    thermal_spectrum = binding_yield_set.*quncher_yield_set;
    figure(2);
    hold on;
    plot(temperature_set,thermal_spectrum);
end

xlim([20 80]);