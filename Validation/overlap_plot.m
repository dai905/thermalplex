percentage_matrix(1,:) = [179 0 0];
percentage_matrix(2,:) = [15 130 4];
%percentage_matrix(2,:) = [134 130 155];
percentage_matrix(3,:) = [101 0 0];

percentage_matrix(1,:) = percentage_matrix(1,:)/sum(percentage_matrix(1,:))*100;
percentage_matrix(2,:) = percentage_matrix(2,:)/sum(percentage_matrix(2,:))*100;
percentage_matrix(3,:) = percentage_matrix(3,:)/sum(percentage_matrix(3,:))*100;

%565 647 overlap

figure(3);
bar(percentage_matrix,'stacked','BarWidth', 0.4);
xlim([0.5 3.5]);
ylim([0 115]);
set(gca,'fontsize',24);
set(gca,'linewidth',1);
ylabel('Percentage (%)');
xlabel('Temperature Channels');
legend('Only 565','Both channels','Only 647','location','Northwest','FontSize',22);
legend boxoff;
set(gca,'XTickLabel',{'48 ^oC','57 ^oC','65 ^oC'});
print(3,'-depsc','Ref_Thermal.eps');




