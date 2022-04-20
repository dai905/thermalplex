function []=showimage(images)

    figure();
    imagesc(images(:,:,1));
    colormap(gray)
    set(gca,'XTickLabel',[]);
    set(gca,'YTickLabel',[]);

end