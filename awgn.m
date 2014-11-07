function [ y ] = awgn( c, s_2 )

n = wgn(1, length(c), s_2, 1, 'linear');
y = c + n;

end

