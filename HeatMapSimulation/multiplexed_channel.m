Probe_set_lib = {[44 35],[52 44],[60 52],[68 62],[77 71]}; % Binding Tm, Quncher Tm
close all;

for c1 = 1:length(Probe_set_lib)
    Probe_set = Probe_set_lib{c1};
    Tm_binding = Probe_set(1);
    Tm_quenching = Probe_set(2);

    [temperature_set,quncher_yield_set] = getYeildFromTemp(Tm_quenching);
    [temperature_set,binding_yield_set] = getYeildFromTemp(Tm_binding);
    binding_yield_set = 1- binding_yield_set;
    thermal_spectrum = binding_yield_set.*quncher_yield_set;
    figure(1);
    hold on;
    plot(temperature_set,thermal_spectrum,'linewidth',2);
end

xlim([20 85]);
ylim([0 0.9]);
set(gca,'fontsize',20);
xlabel('Temperature ^oC');
ylabel('Signal');
box on;
axis square;
box on;