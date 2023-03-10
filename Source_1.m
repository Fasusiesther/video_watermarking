%% Read a video into MATLAB
videoFileReader = VideoReader('video 1.mp4');
 
depVideoPlayer = vision.DeployableVideoPlayer; 
 
%Read frame by frame
while hasFrame(videoFileReader)
    videoFrame = readFrame(videoFileReader);
   %Display video
   depVideoPlayer(videoFrame);
    pause(1/videoFileReader.FrameRate);
end



