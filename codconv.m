function [ c ] = codconv( m, g )

    [G, M] = paramconv(g);
    len = max([length(G(1,:)) + length(m) - 1, length(G(1,:)), length(m)]);
    c = zeros(length(g), len);
    
    for i=1:length(g)
      c(i,:) = mod(conv(m, G(i,:)), 2);
    end
end

