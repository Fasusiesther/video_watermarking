load br
[m,n,tbr]=size(br);
for mm=1:m
    for nn=1:n
        x2(mm,nn)=0;
        for pp=1:8
            x2(mm,nn)=x2(mm,nn)+br(mm,nn,pp)*2^(pp-1);
        end
    end
end
save indexr x2