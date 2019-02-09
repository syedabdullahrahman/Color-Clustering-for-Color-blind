clear
clc
he = imread('colorblind 3.jpg');
figure(1);
imshow(he), title('Input image');

lab_he = rgb2lab(he);
ab = lab_he(:,:,2:3);
nrows = size(ab,1);
ncols = size(ab,2);
ab = reshape(ab,nrows*ncols,2);
nColors = 5;

[cluster_idx, cluster_center] = NEW_KMEANS(ab,nColors);
pixel_labels = reshape(cluster_idx,nrows,ncols);

for i=1:nColors
    mask = pixel_labels==i;
    cluster = he .* mask;
    figure(i+4);
    imshow(cluster),title(sprintf('Objects in Cluster %d', i));
    
end