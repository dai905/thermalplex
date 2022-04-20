% https://web.nmsu.edu/~snsm/classes/chem435/Lab4/

sample_size = 3000;
sequence_length = [10:40];

seq_para = [];

for c1 = 1:length(sequence_length)
    
    para_set = [];
    
    for c2 = 1:sample_size
        seq = randseq(sequence_length(c1));
        [dH,dS] = CalPara(seq);
        para_set(end+1,:) = [dH,dS];
    end
    
    dH_mean = mean(para_set(:,1));
    dS_mean = mean(para_set(:,2));  

    
    Temp_set = [10:100];
    yield_set = GetMeltingCurve(Temp_set,dH_mean,dS_mean);
    
    
    figure(1);
    plot(Temp_set,yield_set);
    
    figure(2);
    yield_derive = diff(yield_set);
    plot(Temp_set(2:end),yield_derive);
    
    x = Temp_set(2:end);
    y = yield_derive;
    f = fit(x.',y.','gauss1');
    
    seq_para(end+1,:) = [sequence_length(c1) dH_mean dS_mean f.b1 f.c1];
end

figure(3);
plot(seq_para(:,1),seq_para(:,5),'-o','linewidth',2);
xlabel('DNA length (nt)');
ylabel('Melting Width (^oC)');
set(gca,'fontsize',24);
figure(4);
plot(seq_para(:,1),seq_para(:,4),'-o','linewidth',2);
xlabel('DNA length (nt)');
ylabel('Melting Temperature (^oC)');
set(gca,'fontsize',24);

figure(5);
hold on;
plot(seq_para(:,4),seq_para(:,5),'-o','linewidth',2);
xlabel('Melting Temperature (^oC)');
ylabel('Melting Width (^oC)');
set(gca,'fontsize',24);
x2 = seq_para(:,4);
y1 = seq_para(:,5);
P = polyfit(x2,y1,1);
y1_cal = x2*P(1)+P(2);
plot(x2,y1_cal,'linewidth',2);
box on;
