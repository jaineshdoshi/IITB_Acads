%%
% Q 7 a 

inputimage1 = imread('Homography/goi1_downsampled.jpg');
H1 = importdata('Homography/HModel.mat');

outputH1 = warp(inputimage1, H1);
Hest = homography(inputimage1, outputH1);

disp(Hest);
calcHwarp = warp(inputimage1, Hest);

figure;
imshow([inputimage1 outputH1 calcHwarp], [0 255]);

%% Q 7 b

inputimage2 = imread('Homography/goi2_downsampled.jpg');

H12 = homography(inputimage1, inputimage2);
disp(H12);

outputH2 = warp(inputimage1, H12);
Hest12 = homography(inputimage1, outputH2);
disp(Hest12);

figure;
imshow([inputimage1 inputimage2 outputH2], [0 255]);
