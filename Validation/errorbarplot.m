function [hfig,hb,child_set] = errorbarplot(x_data,y_data,y_data_err,hfig,bar_width,colour_vals)
%function [hfig,hb,child_set] = errorbarplot(x_data,y_data,y_data_err,hfig,bar_width,colour_vals)

if isempty(colour_vals)
    %colour_vals = [249, 177, 47;249, 96, 47;33, 175, 103;44, 89, 165]/255;
    colour_vals = [91,136,216;44,183,90;247,76,67;244,165,69]/255;%69,115,219]/255;
    colour_vals = [colour_vals;colour_vals;colour_vals;colour_vals];
    
end
if isempty(hfig)
    hfig = figure;
end
if isempty(bar_width)
    bar_width = 0.8;
end
hb = bar(x_data,y_data,bar_width);
hold on
%bar_pos = width/2*[(-1 + 1/length(hb)/2):1/length(hb):
%bar_pos = [-(length(hb)-1)/2:(length(hb)-1)/2]./length(hb).*bar_width/2;
num_vars = length(hb);
bar_pos = [-(num_vars-1)/2:1:(num_vars-1)/2]*2/(2*num_vars+3);
sub_bar_width = bar_width/(2*num_vars+3);
error_bar_width = sub_bar_width/1.5; %changed from 2 on 15/07/19
child_set = [];
if sum(y_data_err(:)) ~= 0
    for c1 = 1:length(hb)
        set(hb(c1),'FaceColor',colour_vals(c1,:));
        %set(hb(c1),'BarWidth',1);        
        for c2 = 1:length(y_data(:,c1))
            child_set(end+1,1) = ...
                plot(...
                (x_data(c2)+bar_pos(c1)).*[1,1],...
                [y_data(c2,c1)-y_data_err(c2,c1),y_data(c2,c1)+y_data_err(c2,c1)],...
                'k-');
            child_set(end+1,1) = ...
                plot(...
                (x_data(c2)+bar_pos(c1))+[-error_bar_width/2,error_bar_width/2],...
                (y_data(c2,c1)-y_data_err(c2,c1))*[1,1],...
                'k-');
            child_set(end+1,1) = ...
                plot(...
                (x_data(c2)+bar_pos(c1))+[-error_bar_width/2,error_bar_width/2],...
                (y_data(c2,c1)+y_data_err(c2,c1))*[1,1],...
                'k-');
        end
    end
else
    for c1 = 1:length(hb)
        set(hb(c1),'FaceColor',colour_vals(c1,:));
        %set(hb(c1),'BarWidth',1);
    end

end
set(gca,'TickDir','out')
set(gca,'XTick',[1:length(x_data)]);
xlim([0.5,length(x_data)+0.5]);
box off
