function [ m ] = decodconv( y, g, mode )

T = paramconv2(g);

treillisColonnes = length(y)/length(g) + 1;
treillisLignes = length(T);

if treillisColonnes ~= fix(treillisColonnes)
    display('Erreur dans la taille de g ou de y.');
    return;
end

y = reshape(y, length(g), length(y)/length(g))';

treillis = cell(treillisLignes, treillisColonnes);
treillis2 = zeros(treillisLignes, treillisColonnes);
treillis{1,1} = {-1, 0, -1};

for t=1:treillisColonnes-1
    for i=1:treillisLignes
        if ~isempty(treillis{i, t})
            for j=1:length( T(1, :) )
                if T(i, j) ~= -1

                    % On calcule le poids du chemin actuel
                    p = dec2bin(T(i,j), length(g))-'0';
                    switch lower(mode)
                        case {'h'}
                            p = xor(y(t, :), p);
                            p = sum(p) + treillis{i, t}{2};
                        case {'s'}
                            p = y(t, :) - p;
                            p = sum(p.^2);
                        otherwise    
                            display('Erreur dans la taille de g ou de y.');
                            return;
                    end
                    
                    % Si la case du treillis a laquelle on veut acceder
                    % n'existe pas, on la cree
                    if isempty(treillis{j, t+1})
                        treillis{j, t+1} = { i, p, fix( (j-1)/(length(T)/2) )};
                        treillis2(j, t+1) = fix( (j-1)/(length(T)/2) );
                    
                    % Si elle existe d�j�
                    else
                        % On compare les poids des diff�rents chemins qui
                        % y m�nent
                        if p < treillis{j, t+1}{2}
                            treillis{j, t+1} = {i, p, fix( (j-1)/(length(T)/2) )};
                            treillis2(j, t+1) = fix( (j-1)/(length(T)/2) );
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
    m(1, t-1) = treillis{suivant, t}{3};
    suivant = treillis{suivant, t}{1};
end

M = log2(treillisLignes);

for i=0:M-1
    m(length(m)) = [];
end

end

