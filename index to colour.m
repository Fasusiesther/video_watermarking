[X,map] = imread('cc.jpg');
%%Verify that the colormap, map, is not empty, and convert the data in X to RGB. 
if ~isempty(map)
    Im = ind2rgb(X,map);
end
imshow(cc)