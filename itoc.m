load indexr
load map
max=256;
x2=uint8(x2);
[m,n]=size(x2);
for mm=1:m
    for nn=1:n
        y=double(x2(mm,nn))+1;
        if y>max
            y=max;
        else
        end
        hr(mm,nn,1)=p(y,1);
        hr(mm,nn,2)=p(y,2);
        hr(mm,nn,3)=p(y,3);
    end
end
imwrite(hr,'hr.png')
imshow(hr)