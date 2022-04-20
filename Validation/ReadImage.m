function images = ReadImage(file_name,channels)

TifLink = Tiff(file_name,'r');

%channels = 1;

for i = 1:length(channels)
    channel = channels(i);
    TifLink.setDirectory(channel);
    images(:,:,i) = TifLink.read();
end


