a = VideoReader('video 4.mp4');
for img = 1:a.NumberOfFrames
    filename = strcat('frame', num2str(img), '.jpg');
    b = read(a, img);
    % Add the watermark to the frame
    watermark = imread('vegfinal.png'); % Replace with the filename of your watermark image
    position = [10 150]; % Replace with the position where you want to add the watermark
    b = imresize(b, size(b) * 0.5); % Resize the frame and the watermark to a smaller size
    watermark = imresize(watermark, size(b) * 0.6);
    b(position(1):position(1)+size(watermark,1)-1, position(2):position(2)+size(watermark,2)-1, :) = watermark;
    % Save the watermarked frame
    imwrite(b, filename);
end
imshow(b)