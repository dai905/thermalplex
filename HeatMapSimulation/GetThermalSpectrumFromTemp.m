function [temperature_set,thermal_spectrum] = GetThermalSpectrumFromTemp(Tm_set)

%Tm_set = [60,60];

[temperature_set,quncher_yield_set] = getYeildFromTemp(Tm_set(1));

[temperature_set,binding_yield_set] = getYeildFromTemp(Tm_set(2));

binding_yield_set = 1- binding_yield_set;

thermal_spectrum = binding_yield_set.*quncher_yield_set;