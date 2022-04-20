dir1=getDirectory("Select the folder where the macro is")
list = getFileList(dir1);

image_file_post_name = "_MMStack_Default.ome.tif"

data_folder = 'RefMelf_validation';
Temperature = '/57C/';

i = 0
//for (i = 0; i<list.length; i++) {

	folder_name = list[i];

	sample_name = substring(folder_name,0,folder_name.length-1);
	image_name = sample_name+image_file_post_name;

    print(folder_name);
	print(image_name);
	file_name = folder_name + image_name;
	print(file_name);
	open(file_name);
	run("Z Project...", "projection=[Max Intensity]"); 
	run("Stack to Images");

	save_folder_name = "/Users/fanhong/Documents/Harvard_Postdoc/2.OnGoingProject/ThermoPlexImaging/10.Manuscript_preparation/Figure2_data/"+data_folder+Temperature;
	stacked_image_a_name = save_folder_name +folder_name + sample_name+"_a.tiff";
	stacked_image_b_name = save_folder_name +folder_name + sample_name+"_b.tiff";
	stacked_image_c_name = save_folder_name +folder_name + sample_name+"_c.tiff";
	//stacked_image_d_name = save_folder_name +folder_name + sample_name+"_d.tiff";
	save(stacked_image_a_name);
	close();
	save(stacked_image_b_name);
	close();
    save(stacked_image_c_name);
    close();
    
    //save(stacked_image_d_name);
    //close(); 
    
    close("*");
    open(stacked_image_a_name);
	setMinAndMax(310, 350);
	//run("Subtract Background...", "rolling=10");
    open(stacked_image_b_name);
	setMinAndMax(160, 190);  
    open(stacked_image_c_name); 
    run("Enhance Contrast", "saturated=0.01");
	setMinAndMax(0, 9000);
	channel_1 = sample_name+"_a.tiff";
    channel_2 = sample_name+"_b.tiff";
    channel_3 = sample_name+"_c.tiff";
    //channel_3 = sample_name+"_c.tiff";
    //run("Merge Channels..."," c2=" + channel_1 + " keep");
	run("Merge Channels...", "c3=" + channel_3 + " c2=" + channel_1 + " keep");
	merged_image_name = save_folder_name +folder_name + sample_name+"_merge_565.tiff";
	save(merged_image_name);
	// merge other channels
	run("Merge Channels...", "c3=" + channel_3 + " c1=" + channel_2 + " keep");
	merged_image_name = save_folder_name +folder_name + sample_name+"_merge_647.tiff";
	save(merged_image_name);
	
	// merge three channels
	run("Merge Channels...", "c3=" + channel_3 + " c2=" + channel_1 + " c1=" + channel_2 + " keep");
	merged_image_name = save_folder_name +folder_name + sample_name+"_merge_647_565.tiff";
	save(merged_image_name);

	close();
	close();
	close();
	close();
	close();
	close();
	
//}