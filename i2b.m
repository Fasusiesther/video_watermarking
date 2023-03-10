load index
x1=x;
x1=double(x1);
[m,n,tt]=size(x);
for mm=1:m
    for nn=1:n
        for pp=1:8
            b(mm,nn,pp)=rem(x1(mm,nn),2);
            x1(mm,nn)=(x1(mm,nn)-rem(x1(mm,nn),2))/2;
        end
    end
end  
save b b