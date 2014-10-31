function [ m ] = decodconv( y, g )

T = paramconv2(g)

treillisColonnes = length(y)/length(g) + 1;
treillisLignes = length(T);

if treillisColonnes ~= fix(treillisColonnes)
    display('Erreur dans la taille de g ou de y.');
    return;
end

y = reshape(y, length(g), length(y)/length(g))'

% Le treillis sera un tableau contenant des entrées de la forme suivante :
%   [t, id_1, id_2, p, m_t]
%       t : instant
%       id_1 : l'id du premier antécédant
%       id_2 : l'id du second antécédant
%       p : le poids

treillis = cell(treillisLignes, treillisColonnes);
treillis2 = zeros(treillisLignes, treillisColonnes);
treillis{1,1} = {-1, -1, 0, -1};

t = 2;

i = 1;
for t=1:treillisColonnes-1
    for i=1:treillisLignes
        if ~isempty(treillis{i, t})
            for j=1:length( T(1, :) )
                if T(i, j) ~= -1

                    % On calcule le poids du chemin actuel
                    p = dec2bin(T(i,j), length(g))-'0';
                    p = xor(y(t, :), p);
                    p = sum(p) + treillis{i, t}{3};
                    
                    % Si la case du treillis a laquelle on veut acceder
                    % n'existe pas, on la cree
                    if isempty(treillis{j, t+1})
                        treillis{j, t+1} = { i, -1, p, fix( (j-1)/(length(T)/2) )};
                        treillis2(j, t+1) = fix( (j-1)/(length(T)/2) );
                    
                    % Si elle existe déjà
                    else
                        % On compare les poids des différents chemins qui
                        % y mènent
                        if p < treillis{j, t+1}{3}
                            treillis{j, t+1} = {i, -1, p, fix( (j-1)/(length(T)/2) )};
                            treillis2(j, t+1) = fix( (j-1)/(length(T)/2) );
                        elseif p == treillis{j, t+1}{3}
                            treillis{j, t+1} = {treillis{j, t+1}{1}, i, p, fix( (j-1)/(length(T)/2) )};
                        end
                    end
                end
            end
        end
    end
end

m = zeros(1, treillisColonnes-1);
suivant = 1;

for t=treillisColonnes:-1:2
    m(1, t-1) = treillis{suivant, t}{4};
    suivant = treillis{suivant, t}{1};
end

m

treillis
treillis{3, 2}{3}
treillis2

end

