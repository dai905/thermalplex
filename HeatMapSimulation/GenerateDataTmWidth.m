Melting_para = [];

for c1 = 1:1000
    
    length = randi([10 40],1);
    sequence = randseq(length);
    [dH,dS] = CalPara(sequence);
    Temp_set = [10:0.1:100];
    yield_set = GetMeltingCurve(Temp_set,dH,dS);
    
    f = fit(Temp_set.',yield_set.','gauss1');
    Melting_para(end+1,:) = [f.b1 f.c1];
    
end
