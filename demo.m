clear all;
close all;
clc;

%% Read image, please your input name
fullFileName='./data/fish.png';
[~,baseFileName,~]=fileparts(fullFileName);
img = im2double(imread(fullFileName));

% Resize a large image to a small image for fast speed. Please uncomment the following code to use
img=imresize(img,0.5);

%% Parameter setting
% Note: there are two key parameters lambda_d and lambda_s. If you
% want to produce better results, you can adjust them in lambda_s with
% [0.01,0.1] and lambda_d with [1,10]. Different input highlight
% images often have different optimal parameters. In general, lower
% the value of lambda_s and higher the value of lambda_d, the
% highlight layer are often with more textures, leading to the
% texture-copy problem, while the diffuse layer is with color
% distortion; the diffuse layer are with residual highlights, while
% the highlight layer is more smoothness and sparse, otherwise. So
% our algorithm is inevitably sensitive to the two key parameters.

lambda_d=10; % weight for diffuse layer
lambda_s=0.1; % weight for highlight layer
K=100; % number of clusters
gamma=[1/3;1/3;1/3]; % illumination color value. It's white illumination color (e.g., [1/3;1/3;1/3]) in default. You can also use existing illumination white-balance methods to estimate the illumination color of the input image
ITERMAX=50; % number of interation for optimization

% Computing diffuse and highlight layers
[diffuse,highlight]=SHR(img,lambda_d,lambda_s,K,gamma,ITERMAX);

%% Show results
figure(1);
subplot(1,3,1);imshow(img);title('input image');
subplot(1,3,2);imshow(diffuse,[]);title('diffuse image');
subplot(1,3,3);imshow(highlight,[]);title('highlight image');

% %% Save results
% outputDir='./output/';
% if ~exist(outputDir,'dir')
%     mkdir(outputDir)
% end
% imwrite(img,[outputDir sprintf('%s.png',baseFileName)]);
% imwrite(diffuse,[outputDir sprintf('%s-diffuse.png',baseFileName)]);
% imwrite(highlight,[outputDir sprintf('%s-highlight.png',baseFileName)]);