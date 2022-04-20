time_set = [5:5:30];

temperature = '65C';

data_57C = [];

for c2 = 1:length(time_set)
    
    time = time_set(c2);
    
    dir_name = sprintf('%s/single_cell_RNA_counts/heating%ds/',temperature,time);
    file_list = dir(sprintf('%s/*.txt',dir_name));

    for c1 = 1:length(file_list)

        file_name = file_list(c1).name;
        full_name = sprintf('%s%s',dir_name,file_name);
        loaded_data = readtable(full_name);
        data_57C(c2,c1) = size(loaded_data,1);
    end
    
    data_57C(c2,7) = mean(data_57C(c2,1:6));
    data_57C(c2,8) = std(data_57C(c2,1:6));

end

writematrix(data_57C,sprintf('%s/%s_puncata_number.txt',temperature,temperature));


