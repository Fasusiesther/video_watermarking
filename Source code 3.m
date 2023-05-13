.%%Reading each frame one by one to the last one
VidObj = VideoReader('video 3.mp4');
%Num_Frames = Vptr.NumberOfFrames;
NFrames = round(VidObj.FrameRate*VidObj.Duration);
%Find the height and weight of the frame
Nrows = VidObj.height;
Ncols = VidObj.width;
%Preallocate the matrix
Img_s = zeros([Nrows,Ncols,NFrames]);
for i = 1:NFrames
%Read each frame
Img = readFrame(VidObj);
%To display all the frames
figure,imshow(Img);
end
%Save the matrix as .mat file
Save Video_Images.mat Img_s;
