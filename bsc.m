function [ y ] = bsc( c,p )

y=zeros(size(c,1),size(c,2));

for i=1:size(c,1)
    for j=1:size(c,2)
        e=rand;
        if e<p
            y(i,j)=abs(c(i,j)-1);
        else
            y(i,j)=c(i,j);
        end
    end
end
       
end

