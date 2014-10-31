function [ T ] = paramconv2( g )

    n=length(g); % Length of the code
    for i=1:n
        gtmp(i) = base2dec(int2str(g(i)),8); % from octal to binary
    end
    G = fliplr(dec2bin(gtmp)-'0');
    M = length(G(1,:))-1;
    size = 2^M;
    T = -1 * ones(size);
    nb = length(g);
    for i=1:2:size
        m = [ 0 dec2bin(i-1,M) - '0'];
        T(i, (i+1)/2) = 0;
        for j=1:nb
            k = mod(sum(m.*G(j,:)), 2);
            T(i, (i+1)/2) = T(i, (i+1)/2) + k * 2^(nb-j);
        end
        
        m = [ 1 dec2bin(i-1,M) - '0'];
        T(i, (size)/2 + (i+1)/2) = 0;
        for j=1:nb
            k = mod(sum(m.*G(j,:)), 2);
            T(i, (size/2) +(i+1)/2) = T(i, (size/2) +(i+1)/2) + k * 2^(nb-j);
        end
        
        m = [ 0 dec2bin(i,M) - '0'];
        T(i+1, (i+1)/2) = 0;
        for j=1:nb
            k = mod(sum(m.*G(j,:)), 2);
            T(i+1, (i+1)/2) = T(i+1, (i+1)/2) + k * 2^(nb-j);
        end
        
        m = [ 1 dec2bin(i,M) - '0'];
        T(i+1, (size)/2 + (i+1)/2) = 0;
        for j=1:nb
            k = mod(sum(m.*G(j,:)), 2);
            T(i+1, (size/2) +(i+1)/2) = T(i+1, (size/2) +(i+1)/2) + k * 2^(nb-j);
        end
    end
end

% mod(sum([mt ...] .* G(1,:)), 2)