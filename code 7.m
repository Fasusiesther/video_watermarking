%%% Read the input video file
videoObj = VideoReader('video 1.mp4');

% Define the patch size and overlap between patches
patchSize = [100, 100];
overlapSize = [25, 25];

% Determine the number of rows and columns of patches
nRows = floor((videoObj.Height - overlapSize(1)) / (patchSize(1) - overlapSize(1)));
nCols = floor((videoObj.Width - overlapSize(2)) / (patchSize(2) - overlapSize(2)));

% Initialize the output video file
outputVideo = VideoWriter('court.avi');
open(outputVideo);

% Iterate through all frames of the video
while hasFrame(videoObj)
    % Read the current frame
    currentFrame = readFrame(videoObj);
    
    % Initialize the output frame
    outputFrame = zeros(videoObj.Height, videoObj.Width, 3, 'uint8');
    
    % Iterate through all patches in the current frame
    for iRow = 1:nRows
        for iCol = 1:nCols
            % Compute the coordinates of the current patch
            patchTop = (iRow - 1) * (patchSize(1) - overlapSize(1)) + 1;
            patchBottom = patchTop + patchSize(1) - 1;
            patchLeft = (iCol - 1) * (patchSize(2) - overlapSize(2)) + 1;
            patchRight = patchLeft + patchSize(2) - 1;
            
            % Extract the current patch from the input frame
            patch = currentFrame(patchTop:patchBottom, patchLeft:patchRight, :);
            
            % Insert the current patch into the output frame
            outputFrame(patchTop:patchBottom, patchLeft:patchRight, :) = patch;
        end
    end
    
    % Write the output frame to the output video file
    writeVideo(outputVideo, outputFrame);
end
implay(outputVideo)
% Close the output video file and release the input video object
close(outputVideo);
delete(videoObj);
