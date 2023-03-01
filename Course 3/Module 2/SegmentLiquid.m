function [BW,maskedImage] = SegmentLiquid(RGB)
%segmentImage Segment image using auto-generated code from Image Segmenter app
%  [BW,MASKEDIMAGE] = segmentImage(RGB) segments image RGB using
%  auto-generated code from the Image Segmenter app. The final segmentation
%  is returned in BW, and a masked image is returned in MASKEDIMAGE.

% Auto-generated by imageSegmenter app on 26-Feb-2023
%----------------------------------------------------


% Convert RGB image into L*a*b* color space.
X = rgb2gray(RGB);

% Threshold image - manual threshold
BW = im2gray(X) > 2.79000e-01;

% Invert mask
BW = imcomplement(BW);

% Open mask with default
radius = 7;
decomposition = 0;
se = strel('disk', radius, decomposition);
BW = imopen(BW, se);

% Fill holes
%BW = imfill(BW, 'holes');
% Close mask with rectangle
dimensions = [5 10];
se = strel('rectangle', dimensions);
BW = imclose(BW, se);
% Create masked image.
maskedImage = RGB;
maskedImage(repmat(~BW,[1 1 3])) = 0;
end



