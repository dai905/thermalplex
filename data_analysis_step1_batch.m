temperature_set = [25:5:70];
intensity_filter_set = [180,110,110,110,110,110,110,110,110,110];

for c1 = 1
    
    close all;
    cur_temp = temperature_set(c1);
    sample_name = sprintf('APC_p15nt_%dC',cur_temp);
    file_name = sprintf('Original_data/MAX_20210620_%s.tif',sample_name);

    images = ReadImage(file_name,1);

    boxsize = 15;
    bg_filter = 20;
    intensity_filter = intensity_filter_set(c1); 
    % set the intensity parameter to identify the spot

    % filter the background
    tophatFiltered_image =filterimage(images,bg_filter);
    % find the puncta
    puncta_location = FindSpot(file_name,boxsize,bg_filter,intensity_filter);

    % get the puncta on the images
    figure(1);
    imagesc(images);
    colormap(gray)
    axis equal;
    set(gca,'visible','off')
    showSpot(puncta_location(:,1:2),boxsize);

    % get the intensity distribution of the puncta
    figure(2);
    histogram(puncta_location(:,3),50)
    set(gca,'fontsize',24);
    xlabel('spot intensity');
    ylabel('Counts');

    % get histogram of images
    figure(3);
    histogram(images(:,:,1));
    set(gca,'fontsize',24);
    xlabel('spot intensity');
    ylabel('Counts');

    analysis_parameters = [boxsize,bg_filter,intensity_filter];

    mkdir('processed_image');
    cd('processed_image');
    writematrix(analysis_parameters, sprintf('%s_analysis_parameters.txt',sample_name))
    writematrix(puncta_location, sprintf('%s_puncta_location.txt',sample_name))
    print(1,'-depsc',sprintf('%s_identified_spot.eps',sample_name));
    print(2,'-depsc',sprintf('%s_punchta_hist.eps',sample_name));
    print(3,'-depsc',sprintf('%s_overall_hist.eps',sample_name));
    cd ..;
    
end




