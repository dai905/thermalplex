function yield = GetMeltingYield(dH,dS,cur_Temp)
% index = 10;
% 
% parameters = readmatrix('seq_para.txt');
% binding_para = parameters(index,:);
% 
% cur_Temp = 80;
% length = binding_para(1,1);
% dH = binding_para(1,2);
% dS = binding_para(1,3);

R = 8.314;
Conc = 2*10^-12.5;
R = 8.314;

Temp = 273 + cur_Temp;
dG = -(dH - (dS*Temp)+2.7);
Keq = 2.718^(-dG*4.18*1000/(R*Temp));

a = 1;
b = Keq/(Conc);
c = -Keq/(Conc);

vector = [a, b, c];

x = roots(vector);

yield = x(2);