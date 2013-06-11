% Encode un vecteur correspondant à un bloc
% en utilisant un algorithme Run Length Coding
%
% Entrees :
%       Vzig    : vecteur de 64 elements
%       diff    : difference entre l'element DC de ce vecteur et celui du vecteur precedent.
%       nb      : nombre de bits sur lequel coder les éléments du vecteur.
%
% Sortie :
%       tableau : vecteur encodé.
%

function tableau = code_bloc(Vzig,diff,nb)

nonZero    = find(Vzig);
nonZero    = nonZero(2:length(nonZero));
nonZeroLen = length(nonZero);
nonZeroPrec = 1;

% Premier element du bloc
tableau(1) = nb;
tableau(2) = diff;

i = 3; % Prochain element de tableau

% Elements suivants    
% premier element de Vzig nul ?
if nonZeroLen == 0
    tableau(3) = 0;
    tableau(4) = 0;
    return;
end

for j = 1 : nonZeroLen;
   tableau(i)   = nonZero(j) - nonZeroPrec - 1;
   nonZeroPrec  = nonZero(j);
   tableau(i+1) = nb;
   tableau(i+2) = Vzig(nonZero(j));
   
   i = i + 3;
end

if(nonZero(nonZeroLen) ~= 64) 
    tableau(3*(nonZeroLen+1) )    = 0;
    tableau(3*(nonZeroLen+1) + 1) = 0;
end

%size(tableau)

end