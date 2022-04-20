function yield_set = GetMeltingCurve(Temp_set,dH,dS)

%quncher_seq = randseq(20);

Conc = 2*10^-11;
R = 8.314;

%Temp_set = [10:0.2:90];
yield_set = [];


for c2 = 1:length(Temp_set)

    Temp = 273 + Temp_set(c2);
    dG = -(dH - (dS*Temp)+2.7);

    Keq = 2.718^(-dG*4.18*1000/(R*Temp));

    a = 1;
    b = Keq/(Conc);
    c = -Keq/(Conc);

    vector = [a, b, c];

    x = roots(vector);

    yield = x(2);
    yield_set(end+1) = yield;

end