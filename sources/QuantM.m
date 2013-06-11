%
% Calcul de la matrice de Quantification
% 
% Entrée : qualité
% Sortie : Matrice QM associée
%
% Détermination du facteur de qualité : 
%   Fq = 50/Quality       si Quality <= 50
%   Fq = 2 - Quality / 50 si Quality >  50
%
%

function QM = QuantM(Quality)

if Quality <= 50 
    Fq = 50 / Quality;
else
    Fq = 2 - Quality / 50;
end


QM = Fq * [ 16 11 10 16 24 40 51 61
            12 12 14 19 26 58 60 55
            14 13 16 24 40 57 69 56
            14 17 22 29 51 87 80 62
            18 22 37 56 68 109 103 77
            24 35 55 64 81 104 113 92
            49 64 78 87 103 121 120 101
            72 92 95 98 112 100 103 99
            ];

           
for i =1:8
    for j = 1:8
        if QM(i,j)<1
            QM(i,j) = 1;
        end
        if QM(i,j)>255
            QM(i,j) = 255;
        end
    end
end