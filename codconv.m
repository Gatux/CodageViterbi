function [ c ] = codconv( m, g )

    % Calcul de la matrice g�n�ratrice G, ainsi que de la m�moire M du
    % codeur
    [G, M] = paramconv(g);
    
    % On calcule d'avance la taille de la matrice c qui va contenir la
    % s�quence de bits � transmettre sur le canal
    len = max([length(G(1,:)) + length(m) - 1, length(G(1,:)), length(m)]);
    c = zeros(length(g), len);
    
    % La ni�me ligne de la matrice sera �gale au produit de convolution 
    % modulo 2 du vecteur de bits m et des coefficients du polyn�mes g_n
    for i=1:length(g)
      c(i,:) = mod(conv(m, G(i,:)), 2);
    end
    
    % S�quence de bits finale � transmettre
    c = reshape(c, 1, length(c)*length(c(:,1)));
end

