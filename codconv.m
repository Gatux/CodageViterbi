function [ c ] = codconv( m, g )

    % Calcul de la matrice génératrice G, ainsi que de la mémoire M du
    % codeur
    [G, M] = paramconv(g);
    
    % On calcule d'avance la taille de la matrice c qui va contenir la
    % séquence de bits à transmettre sur le canal
    len = max([length(G(1,:)) + length(m) - 1, length(G(1,:)), length(m)]);
    c = zeros(length(g), len);
    
    % La nième ligne de la matrice sera égale au produit de convolution 
    % modulo 2 du vecteur de bits m et des coefficients du polynômes g_n
    for i=1:length(g)
      c(i,:) = mod(conv(m, G(i,:)), 2);
    end
    
    % Séquence de bits finale à transmettre
    c = reshape(c, 1, length(c)*length(c(:,1)));
end

