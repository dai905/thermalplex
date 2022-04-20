function tophatFiltered_image =filterimage(images,parameter)

    se = strel('disk',parameter);
    tophatFiltered_image = imtophat(images(:,:,1),se);

end