%Make the Below path as the Current Folder
cd('C:\Program Files\Matlab\bin\My  Images watermark\videos folder.jpg');
%Obtain all the JPEG format files in the current folder
Files = dir('*.jpg');
%Find the total number of JPEG files in the Current Folder
NumFiles= size(Files,1);
%Preallocate a 4-D matrix to store the Image Sequence
%Matrix Format : [Height Width 3 Number_Of_Images]
Uphold_Images = uint8(zeros([294 419 3 NumFiles*2]));
%To write Video File
VideoObj = VideoWriter('React.mp4');
%Number of Frames per Second
VideoObj.FrameRate = 2; 
%Define the Video Quality [ 0 to 100 ]
VideoObj.Quality   = 60;  
count=1;
for i = 1 : NumFiles
   %Read the Images in the Current Folder one by one using For Loop
   I = imread(Files(i).name);
   %The Size of the Images are made same
   ResizeImg = imresize(I,[294 419]);
   %Each Image is copied 2 times so that in a second 1 image can be viewed
   for j = 1 : 2
     Uphold_Images(:,:,:,count)=ResizeImg;
     count = count + 1;
   end
end
%Open the File 'React.mp4'
open(VideoObj);
%Write the Images into the File 'React.mp4'
writeVideo(VideoObj,Uphold_Images );
%Close the file 'React.mp4'
close(VideoObj);

