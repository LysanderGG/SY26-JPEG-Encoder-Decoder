imgLoad;

[img1Width, img1Height] = size(img1);

[SNR, compression, signalCompresse] = codJPG(100,img1);
imgRec = decJPG(100, signalCompresse, imgWidth, imgHeight);

[SNR, compression, signalCompresse] = codJPG(50,img1);
imgRec2 = decJPG(50, signalCompresse, imgWidth, imgHeight);

[SNR, compression, signalCompresse] = codJPG(10,img1);
imgRec3 = decJPG(10, signalCompresse, imgWidth, imgHeight);

subplot(2,2,1);
imshow(img);
subplot(2,2,2);
imshow(imgRec);
subplot(2,2,3);
imshow(imgRec2);
subplot(2,2,4);
imshow(imgRec3);