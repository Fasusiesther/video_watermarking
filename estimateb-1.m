br=zeros(m,n,8);
pdout=0;
for k=1:mn
    sum1=0;
    sum0=0;
    for kc=1:6
        if dout(kc,k)==0
            if dmark(kc,k)==0
                sum0=sum0+1;
            else
                sum1=sum1+1;
            end
        else
            pdout=pdout+1;
        end
    end
    if sum1>sum0
        br(k)=1;
    else
        br(k)=0;
    end
end
save br br
        