parameters = readmatrix('seq_para_set3.txt');

Quncher_Tm = 53;
Binding_Tm = 61; 

[temperature_set,quncher_yield_set] = getYeildFromTemp(Quncher_Tm);
[temperature_set,binding_yield_set] = getYeildFromTemp(Binding_Tm);

binding_yield_set = 1- binding_yield_set;

thermal_spectrum = binding_yield_set.*quncher_yield_set;
f = fit(temperature_set.',thermal_spectrum.','gauss1');
%f = fit(x.',y.','gauss1');

close all;
figure(1);
hold on;
plot(temperature_set,quncher_yield_set,'linewidth',2);
plot(temperature_set,binding_yield_set,'linewidth',2);
plot(temperature_set,thermal_spectrum,'linewidth',2);
set(gca,'fontsize',18);
xlabel('Temperature (^oC)');
ylabel('Signal Yield');
xlim([20 80]);
axis square;
legend('Free quencher','Bound imager','Signal','location','Northwest');
legend boxoff;
box on;




