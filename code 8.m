%%% Read the input video file
videoObj = VideoReader('video 1.mp4');

% Define the number of temporal layers
numLayers = 3;

% Define the stack decomposition filters
filters = cell(numLayers, 1);
for i = 1:numLayers
    filters{i} = fspecial('gaussian', [i*2+1 i*2+1], i);
end

% Initialize the output video file
outputVideo = VideoWriter('mine.avi');
open(outputVideo);

% Iterate through all frames of the video
while hasFrame(videoObj)
    % Read the current frame
    currentFrame = readFrame(videoObj);
    
    % Initialize the temporal layers
    layers = cell(numLayers, 1);
    for i = 1:numLayers
        layers{i} = zeros(size(currentFrame));
    end
    
    % Apply the stack decomposition filters to the current frame
    for i = 1:numLayers
        filtered = imfilter(currentFrame, filters{i}, 'replicate', 'same', 'conv');
        layers{i} = currentFrame - filtered;
    end
    
    % Write the temporal layers to the output video file
    for i = 1:numLayers
        writeVideo(outputVideo, layers{i});
    end
end
disp(outputVideo)
% Close the output video file and release the input video object
close(outputVideo);
delete(videoObj);
