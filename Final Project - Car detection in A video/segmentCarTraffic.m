function [BW,maskedImage] = segmentCarTraffic(X)
%segmentImage Segment image using auto-generated code from Image Segmenter app
%  [BW,MASKEDIMAGE] = segmentImage(X) segments image X using auto-generated
%  code from the Image Segmenter app. The final segmentation is returned in
%  BW, and a masked image is returned in MASKEDIMAGE.

% Auto-generated by imageSegmenter app on 01-Mar-2023
%----------------------------------------------------


% Threshold image - manual threshold
BW = im2gray(X) > 8.870600e-02;

% Dilate mask with rectangle
dimensions = [6 18];
se = strel('rectangle',dimensions);
BW = imdilate(BW, se);

% Close mask with disk
radius = 11;
decomposition = 0;
se = strel('disk', radius, decomposition);
BW = imclose(BW, se);

% Erode mask with disk
radius = 8;
decomposition = 0;
se = strel('disk', radius, decomposition);
BW = imerode(BW, se);

% Open mask with disk
radius = 6;
decomposition = 0;
se = strel('disk', radius, decomposition);
BW = imopen(BW, se);


% Create masked image.
maskedImage = X;
maskedImage(~BW) = 0;
end

