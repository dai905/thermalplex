function binary_cell_mask = GetCellMask(maske_image)
        %maske_image = 'Cell_mask/cell1_mask.tiff';
        binary_cell_mask = cell_mask>120;

