%
% Application de la DCT à une matrice
%
% Entrée : matrice
% Sortie : matrice DCT
%

function D = MyDCT(B)

% Recuperation des dimensions de l'image
[nbLignes, nbColonnes] = size(B);

D = double(zeros(nbLignes, nbColonnes));
C = zeros(nbLignes,1);
C(1) = 1/sqrt(2);

for i = 2 : nbLignes
    C(i) = 1;
end

for u = 1 : nbLignes
    for v = 1 : nbColonnes
        result = double(0);
        for x = 1 : nbLignes
            for y = 1 : nbColonnes
                k = B(x,y) * cos((2*(x-1)+1)*pi*(u-1)/16) * cos((2*(y-1)+1)*pi*(v-1)/16);
                result = double(result) + double(k);
            end
        end
        D(u,v) = 1/4 * C(u) * C(v) * result;
    end
end

end