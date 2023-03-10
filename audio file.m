%% Load the video
video = VideoReader('video 1.mp4');
%% Load the audio file
[audio, Fs] = audioread('welby.mp3');
% Get the video frame rate
frame_rate = video.FrameRate;
% Get the video frames as images
frames = read(video);
% Calculate the number of frames
num_frames = size(frames, 4);
% Calculate the duration of the video
duration = num_frames/frame_rate;
% Calculate the duration of each frame
frame_duration = 1/frame_rate;
% Create an empty matrix to store the audio data for each frame
audio_frames = zeros(num_frames, 1);
% Split the audio data into individual frames
for i = 1:num_frames
    start_time = (i-1)*frame_duration;
    end_time = i*frame_duration;
    audio_frames(i) = mean(audio(floor(start_time*Fs)+1:floor(end_time*Fs)));
end
% Normalize the audio data for each frame
audio_frames = audio_frames/max(abs(audio_frames))
% Create a VideoWriter object to save the video
writerObj = VideoWriter('New_video 1.mp4', 'MPEG-4');
writerObj.FrameRate = frame_rate;
open(writerObj);
% Write the frames and audio data to the video
for i = 1:num_frames
    writeVideo(writerObj, frames(:,:,:,i));
    addaudio(writerObj, audio_frames(i), 'SampleRate', Fs);
end
% Close the VideoWriter object
close(writerObj);
imshow('New_video 1.mp4');
