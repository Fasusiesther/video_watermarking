% Load the original MP4 video file
video = VideoReader('video 2.mp4');
% Determine the number of frames and frame dimensions
numFrames = video.NumberOfFrames;
frameHeight = video.Height;
frameWidth = video.Width;
 
% Create a new MP4 video file with the inserted file
outputFilename = 'Rested_day.mp4';
writerObj = VideoWriter(outputFilename, 'MPEG-4');
open(writerObj);
 
% Loop through each frame of the original video and write it to the new video
for k = 1:numFrames
    % Read the current frame
    frame = read(video, k);
    
    % Insert the file into the frame (for example, a JPG image file)
    if mod(k, 80) == 0 % insert the file every 80 frames
        file = imread('table2.jpg');
        file = imresize(file, [frameHeight/4, frameWidth/4]); % resize the file to fit a quarter of the frame
        [fileHeight, fileWidth, ~] = size(file);
        rowStart = randi(frameHeight - fileHeight);
        colStart = randi(frameWidth - fileWidth);
        frame(rowStart:rowStart+fileHeight-1, colStart:colStart+fileWidth-1, :) = file;
    end
    
    % Write the modified frame to the new video
    writeVideo(writerObj, frame);
end
 
% Close the new video file
close(writerObj);
