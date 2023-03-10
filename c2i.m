c=imread('w.jpg');
r=c(:,:,1); g=c(:,:,2); b=c(:,:,3);
p(1,1)=r(1,1); p(1,2)=g(1,1); p(1,3)=b(1,1);
x(1,1)=0;PC=1;
[M,N,tt]=size(c);
for m=1:M
    for n=1:N
        if m==1 & n==1
           continue
        else
              for pc=1:PC     
                    if r(m,n)>(double(p(pc,1))+k1) 
                       d=0;
                   elseif r(m,n)<(double(p(pc,1))-k1)  
                       d=0;
                   elseif g(m,n)>(double(p(pc,2))+k1) 
                       d=0;
                   elseif g(m,n)<(double(p(pc,2))-k1) 
                       d=0;
                   elseif b(m,n)>(double(p(pc,3))+k1) 
                       d=0;
                   elseif (b(m,n)<(double(p(pc,3))-k1))
                       d=0;
                    else 
                     x(m,n)=pc-1;
                     d=1;
                    end
                    if d==1
                        break
                    else
                    end
              end
              if d==0
                 x(m,n)=PC;
                 PC=PC+1;
                  p(PC,1)=r(m,n);p(PC,2)=g(m,n);p(PC,3)=b(m,n);
              else
              end
        end
    end
end
PC;
if PC>256
fr=zeros(PC);
for m=1:M
    for n=1:N 
        fr(x(m,n)+1)=fr(x(m,n)+1)+1;
    end
end
for m=1:PC
    f(m,1)=m;f(m,2)=fr(m);
end
for m=1:(PC-1)
    for n=(m+1):PC
        if f(n,2)>f(m,2)
            fa1=f(n,1);fa2=f(n,2);
            f(n,1)=f(m,1);f(n,2)=f(m,2);
            f(m,1)=fa1;f(m,2)=fa2;
        else
        end
    end
end
for m=1:256
    for t=1:3
        pp(m,t)=p(f(m,1),t);
    end
end
p=[];
p=pp;
for m=1:M
    for n=1:N
        k=0;
        d=0;
        while d==0
            k=k+1;
              for pc=1:256     
                    if r(m,n)>(double(p(pc,1))+k) 
                       d=0;
                   elseif r(m,n)<(double(p(pc,1))-k)  
                       d=0;
                   elseif g(m,n)>(double(p(pc,2))+k) 
                       d=0;
                   elseif g(m,n)<(double(p(pc,2))-k) 
                       d=0;
                   elseif b(m,n)>(double(p(pc,3))+k) 
                       d=0;
                   elseif (b(m,n)<(double(p(pc,3))-k))
                       d=0;
                    else 
                     x(m,n)=pc-1;
                     d=1;
                    end
                    if d==1
                        break
                    else
                    end
              end
        end
        K(m,n)=k;
    end
end
fr=[];
max=256;
else
    max=PC;
end
save index x
save map p  
save max max