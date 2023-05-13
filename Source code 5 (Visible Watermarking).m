%%How to watermark a video using logo images (Visible watermarking)
% Read in the video file
vidObj = VideoReader('video 2.mp4');
 
% Read in the watermark image
watermark = imread('table 2.jpg');
watermark_alpha = 0.5;  % alpha value for watermark transparency (adjust as needed)
 
% Define the location of the watermark in the video frame
watermark_pos = [50, 50];
 
% Create a new video writer object
outObj = VideoWriter('marked.mp4', 'MPEG-4');
open(outObj);
 
% Loop over each frame in the video and add the watermark
while hasFrame(vidObj)
    frame = readFrame(vidObj);
    
    % Add the watermark to the frame
    watermarked_frame = frame;
    watermarked_frame(watermark_pos(1):watermark_pos(1)+size(watermark, 1)-1, ...
        watermark_pos(2):watermark_pos(2)+size(watermark, 2)-1, :) = ...
        (1-watermark_alpha)*watermarked_frame(watermark_pos(1):watermark_pos(1)+size(watermark, 1)-1, ...
        watermark_pos(2):watermark_pos(2)+size(watermark, 2)-1, :) + ...
        watermark_alpha*watermark;
    
    % Write the watermarked frame to the new video
    writeVideo(outObj, watermarked_frame);
end
once you paste the code in your editor,just wait a little, to find the output object, Then implay it,if it thows error relax and redo it or give it another name,it will give the watermarked video with logo.
 implay('marked.mp4')
