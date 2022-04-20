function [dH,dS] = CalPara(seq)

%seq = 'CAGCGCAAGCA';
energy_info = loadCSVabsFileRawtoStructure('dHdS_full.csv','');

dH = 0;
dS = 0;

for c1 = 1:length(seq)-1

    neibor = seq(c1:c1+1);

    [index1,~] = find(strcmp(neibor,energy_info)==1);
    [index2,~] = find(strcmp(d_revcomp(neibor),energy_info)==1);

    if ~isempty(index1)
       index = index1;
    elseif ~isempty(index2)
       index = index2;
    end

    dH = dH + str2num(energy_info{index,6});
    dS = dS + str2num(energy_info{index,7});
end