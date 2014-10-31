function [ y ] = bsc( c,p )

y=[];

for i=1:length(c)
    e=rand;
    if e<p
        y=[y abs(c(1,i)-1)];
    else
        y=[y c(1,i)];
    end
end
       
end

