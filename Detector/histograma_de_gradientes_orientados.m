
img = imread('xxxx.jpg');

[featureVector,hogVisualization] = extractHOGFeatures(img);

figure;
imshow(img); 
hold on;
plot(hogVisualization);


