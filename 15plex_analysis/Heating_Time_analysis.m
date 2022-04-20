time_data = readtable('20211108_heating_time.csv');

Set_Temperature = 65;

index = find(time_data.Setpoint==65);

sub_data = time_data(index,:);



figure(1);
plot(time_data.DeviceTime,time_data.Temperature,'linewidth',2);
xlabel('Time(s)');
ylabel('Temperature(^oCs)');
set(gca,'fontsize',24);
%print(1,'-djpeg','-r600','heating_profil.jpeg');

figure(2);
time_span = 9200:9400;
Time_slot = time_data.DeviceTime;
Time_slot = Time_slot(time_span);

Temperature_slot = time_data.Temperature;
Temperature_slot = Temperature_slot(time_span);

plot(Time_slot,Temperature_slot,'linewidth',2);
ylim([20 70]);
xlabel('Time(s)');
ylabel('Temperature(^oCs)');
set(gca,'fontsize',24);