%%To read the video in matlab, we need to give it a name.
a= VideoReader('video 4.mp4');
get (a)
%% To start the reading of the video frame one by one and labelling it accordingly
a= VideoReader('video 4.mp4');
for img = 1:a.NumberOfFrames;
    filename = strcat('frame',num2str(img),'.jpg');
    b =read(a,img);
    imwrite(b,filename);
end

