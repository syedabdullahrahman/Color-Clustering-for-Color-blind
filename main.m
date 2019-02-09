clear;
clc
X = [1 2 
4 5 
4 8 
5 10
125 130;
140 138;
112 141;
2 4;
6 4;
8 1;
110 120;
130 125;
140 135];

K = 2;

readImage = imread('ColorMacro.jpg');
[x,y,z]= size(readImage);
A=[];
A=reshape(readImage,[x*y,z]);

%I=shuffle_row(readImage);
[lb,center]=ColorClustering(readImage);
%center

%A=A(52500:53000,1:3);

%X=shuffle_row(A);

%[IDX,C,SUMD,K]=kmeans_opt(X);
%IDX

%csvwrite('data.csv',A);

centroids=[];
max_iterations = 10;
centroids = kMeansInitCentroids(X, K);

for i=1:max_iterations
  indices = findClosestCentroids(X, centroids);
  centroids = computeCentroids(X, indices, K);
end
centroids
indices

