% Quality : le facteur de qualité entre 1 et 100
% img : image matricielle
function testJPG(imgBase)

% Soustraction de 128 à chaque bit de l'image
img = double(imgBase) - 128;
[nbLignes, nbCols] = size(img);

newImg = zeros(nbLignes, nbCols);

%% Table de quantifiquation QM
QM = QuantM(100);

% Initialisation de signalCompresse
signalCompresse = [];
indiceDCprec = 0;

for i = 1 : nbLignes / 8
    for j = 1 : nbCols / 8
        
        subImg = img((i-1)*8+1 : i*8, (j-1)*8 + 1 : j*8);
        % Iteration selon les blocs de 8x8

        % DCT
        subImgDCT = MyDCT(subImg);
        
        %% Quantification 
        Dq = floor((double(subImgDCT) ./ double(QM))+0.5);

        % ZigZag
        Vzig=zigzag(Dq);
        
        % codage
        diff = Vzig(1) - indiceDCprec;
        newIndiceDCprec = Vzig(1);
        subImgCodVector = code_bloc(Vzig, diff, 8);
        
        % decodage
        [newSubImg, k, kk] = decode_bloc(subImgCodVector, 1, indiceDCprec);
        
        % zigzag inverse
        VzigInv = zigzagInv(newSubImg);
        
        % quantif inverse
        subImgDCTRec = double(VzigInv) .* double(QM);
        
        % DCT inverse
        subImgRec = MyDCTInv(subImgDCTRec);
        
        % Placement de la sous image dans l'image
        for l = 1 : 8
            for c = 1 : 8
                newImg((i-1)*8 + l, (j-1)*8 + c) = subImgRec(l,c);
            end
        end
        
        indiceDCPrec = newIndiceDCprec;
    end
end

newImg = newImg + 128;

subplot(1,2,1);
imshow(imgBase);
subplot(1,2,2);
imshow(uint8(newImg));


end