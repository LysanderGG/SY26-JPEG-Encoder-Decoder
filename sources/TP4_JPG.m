img1 = rgb2gray(imread('lena.bmp'));
img2 = imread('airfield512x512.tif');
img3 = imread('boats512x512.tif');
img4 = imread('bridge512x512.tif');
img5 = imread('harbour512x512.tif');
img6 = imread('peppers512x512.tif');

[SNR1_1, compression1_1, signalCompresse1_1] = codJPG(1,   img1);
[SNR1_2, compression1_2, signalCompresse1_2] = codJPG(20,  img1);
[SNR1_3, compression1_3, signalCompresse1_3] = codJPG(50,  img1);
[SNR1_4, compression1_4, signalCompresse1_4] = codJPG(100, img1);

%[SNR2_1, compression2_1, signalCompresse2_1] = codJPG(1,   img2);
%[SNR2_2, compression2_2, signalCompresse2_2] = codJPG(20,  img2);
%[SNR2_3, compression2_3, signalCompresse2_3] = codJPG(50,  img2);
%[SNR2_4, compression2_4, signalCompresse2_4] = codJPG(100, img2);
%
%[SNR3_1, compression3_1, signalCompresse3_1] = codJPG(1,   img3);
%[SNR3_2, compression3_2, signalCompresse3_2] = codJPG(20,  img3);
%[SNR3_3, compression3_3, signalCompresse3_3] = codJPG(50,  img3);
%[SNR3_4, compression3_4, signalCompresse3_4] = codJPG(100, img3);
%
%[SNR4_1, compression4_1, signalCompresse4_1] = codJPG(1,   img4);
%[SNR4_2, compression4_2, signalCompresse4_2] = codJPG(20,  img4);
%[SNR4_3, compression4_3, signalCompresse4_3] = codJPG(50,  img4);
%[SNR4_4, compression4_4, signalCompresse4_4] = codJPG(100, img4);
%
%[SNR5_1, compression5_1, signalCompresse5_1] = codJPG(1,   img5);
%[SNR5_2, compression5_2, signalCompresse5_2] = codJPG(20,  img5);
%[SNR5_3, compression5_3, signalCompresse5_3] = codJPG(50,  img5);
%[SNR5_4, compression5_4, signalCompresse5_4] = codJPG(100, img5);
%
%[SNR6_1, compression6_1, signalCompresse6_1] = codJPG(1,   img6);
%[SNR6_2, compression6_2, signalCompresse6_2] = codJPG(20,  img6);
%[SNR6_3, compression6_3, signalCompresse6_3] = codJPG(50,  img6);
%[SNR6_4, compression6_4, signalCompresse6_4] = codJPG(100, img6);
%