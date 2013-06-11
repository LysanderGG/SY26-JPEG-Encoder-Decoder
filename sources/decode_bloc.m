% Decode le signal a partir de l'indice i
% afin de reconstituer un vecteur de 64 elements.
%
% Entrees : 
%           signalCompresse     : signal
%           i                   : indice a partir duquel commencer l'analyse
%           indiceDCPrecedent   : indice DC du bloc precedent (permet de calculer l'indice DC de ce bloc).
%
% Sorties :
%           zigVector           : vecteur de 64 elements
%           i                   : indice du signal après analyse de ce bloc
%           indiceDCPrecedent   : nouvel indice DC.
%

function [zigVector, i, indiceDCPrecedent] = decode_bloc(signalCompresse, i, indiceDCPrecedent)

zigVector = double(zeros(1,64));
    
% Premier bloc
% Premier nombre : nombre de bits sur lequel est codé le coefficient
% 2e             : difference avec indiceDCPrecedent
zigVector(1) = signalCompresse(i+1) + indiceDCPrecedent;
indiceDCPrecedent = zigVector(1);
i = i+2;

% Suite
% j : taille actuelle de subImg
j = 2;
while(j <= 64 && ~(signalCompresse(i) == 0 && signalCompresse(i+1) == 0))
    % signalCompresse(i)   : nombre de zeros precedant
    % signalCompresse(i+1) : nombre de bits codant le coefficient suivant
    % signalCompresse(i+2) : valeur du coefficient

    % On laisse le nombre de 0 qu'il faut
    j = j + signalCompresse(i);
    % Puis on met le coefficient
    zigVector(j) = signalCompresse(i+2);

    i = i + 3;
    j = j + 1;
end

% Si la serie se finit par 0,0 il faut laisser la fin du vector à 0
if( i < length(signalCompresse) )
    if(signalCompresse(i) == 0 && signalCompresse(i+1) == 0)
        i = i + 2;
    end
end

end
