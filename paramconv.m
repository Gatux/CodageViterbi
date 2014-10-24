function [G,M] = paramconv(g)
% g : vectors with entries in octal representing the polynomial generators of a dimension 1 convolutional code. 
% G : binary matrix whose rows contains the coefficients of each polynomial generator specified in g, from lowest to highest degree. 
% M : memory of the convolutional code specified by the generator polynomials in g.


n=length(g); % Length of the code

for i=1:n
    gtmp(i) = base2dec(int2str(g(i)),8); % from octal to binary
end
G = fliplr(dec2bin(gtmp)-'0');

M=length(G(1,:))-1; 

end

