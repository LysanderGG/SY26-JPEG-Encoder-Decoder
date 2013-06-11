%
% Encodage JPEG d'une image avec qualité
%
% Entrées : 
%       Quality : le facteur de qualité entre 1 et 100
%       img     : image matricielle
% Sorties :
%       SNR             : SNR associé à la compression
%       compression     : taux de compression
%       signalCompresse : signal résultant de la compression
%
function [SNR, compression, signalCompresse] = codJPG(Quality, img)

% Soustraction de 128 à chaque bit de l'image
img = double(img) - 128;
[nbLignes, nbCols] = size(img);

% TODO : Padding de l'image si necessaire


%% Table de quantifiquation QM
QM = QuantM(Quality);

% Initialisation de signalCompresse
signalCompresse = [];
signalCompresse = double(signalCompresse);
SNR = 0;
indiceDCprec = 0;

for i = 1 : nbLignes / 8
    for j = 1 : nbCols / 8
        nbBlocs = nbBlocs + 1;
        subImg = img((i-1) * 8 + 1 : i * 8, (j-1)*8 + 1 : j*8);
        % Iteration selon les blocs de 8x8

        %% DCT2
        subImgDCT = MyDCT(subImg);

        %% Quantification 
        Dq = floor((double(subImgDCT) ./ double(QM))+0.5);
        [ NMSE, SNR_bloc ] = q1(subImgDCT, Dq);
        SNR = SNR + SNR_bloc / ((nbLignes/8)*(nbCols/8));
        % ZigZag
        Vzig=zigzag(Dq);

        diff = Vzig(1) - indiceDCprec;
        indiceDCprec = Vzig(1);
        signalCompresse = [signalCompresse code_bloc(Vzig,diff,8)];
    end
end

% Calcul de la compression
compression = 1 - (length(signalCompresse) * 8) / ((nbLignes * nbCols) * 8)

end