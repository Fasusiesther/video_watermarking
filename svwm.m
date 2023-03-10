bload b
load A
B=A;
load index
[M,N,tt,frame]=size(A);
[m,n]=size(x);
k=0;
kc=1;
mn=m*n*8;
for Fm=1:2:frame
    Fm
    if kc==4
        break
    else
    end
    for t=1:tt
        if kc==4
            break
        else
        end
        for Mm=1:2:M
            if kc==4
                break
            else
            end
            for Nn=1:2:N
                if k<mn
                    k=k+1;
                else
                    k=1;kc=kc+1;
                    if kc==4
                        break
                    else
                    end
                end
                B(Mm,Nn,t,Fm)=B(Mm,Nn,t,Fm)+2*cons*b(k)-cons;
            end
        end
    end
end
k=0;
for Fm=frame:-2:1
    Fm
    if kc==7
        break
    else
    end
    for t=1:tt
        if kc==7
            break
        else
        end
        for Mm=1:2:M
            if kc==7
                break
            else
            end
            for Nn=1:2:N
                if k<mn
                    k=k+1;
                else
                    k=1;kc=kc+1;
                   if kc==4
                        break
                    else
                    end
                end
                B(Mm,Nn,t,Fm)=B(Mm,Nn,t,Fm)+2*cons*b(k)-cons;
            end
        end
    end
end
save B B


                
    
    
    