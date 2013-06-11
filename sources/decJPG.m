% Quality : le facteur de qualité entre 1 et 100
% img : image matricielle
function img = decJPG(Quality, signalCompresse, nbLignes, nbCols)

img = double(zeros(nbLignes, nbCols));

% Reconstiution des blocs de 8x8
i = 1;
indiceDCPrecedent = 0;
QM = QuantM(Quality);
ligneActuelle = 1;
colActuelle   = 1;

% TODO - il doit y avoir un pb dans la gestion des décallages d'indices
while i <= length(signalCompresse)
    [zigVector, i, indiceDCPrecedent] = decode_bloc(signalCompresse, i, indiceDCPrecedent);
    % Le vector est desormais correct
    
    % Reconstitution de la subImg
    Dq = zigzagInv(zigVector);
    
    % Inverse de la quantification
    % Dq = floor((subImgDCT ./ double(QM))+0.5);
    subImgDCT = double(Dq) .* double(QM);
        
    % DCT Inverse
    subImg = MyDCTInv(subImgDCT);
    
    % Placement de la sous image dans l'image
    for l = 1 : 8
        for c = 1 : 8
            img((ligneActuelle-1)*8 + l, (colActuelle-1)*8 + c) = subImg(l,c);
        end
    end
    colActuelle = mod(colActuelle+1, nbCols/8 + 1);
    if(colActuelle == 0)
       colActuelle = 1;
       ligneActuelle = ligneActuelle + 1; 
    end
end

% On réajoute 128 à chaque pixel
img = double(img) + 128;
img = uint8(img);

% Affichage de l'image
imshow(img);

end