%
% Application de la DCT inverse à une matrice
%
% Entrée : matrice DCT
% Sortie : matrice 
%

function B = MyDCTInv(DCT)

nbLignes   = 8;
nbColonnes = 8;

B = double(zeros(nbLignes, nbColonnes));
C = zeros(nbLignes,1);
C(1) = 1/sqrt(2);

for i = 2 : nbLignes
    C(i) = 1;
end

for x = 1 : nbLignes
    for y = 1 : nbColonnes
        result = double(0);
        for i = 1 : nbLignes
            for j = 1 : nbColonnes
                k = C(i) * C(j) * DCT(i,j) * cos((2*(x-1)+1)*pi*(i-1)/16) * cos((2*(y-1)+1)*pi*(j-1)/16);
                result = double(result) + double(k);
            end
        end
        B(x,y) = 1/4 * result;
    end
end

end