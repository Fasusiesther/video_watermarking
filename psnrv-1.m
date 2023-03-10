mse=0;
[M,N,tt,frame]=size(A);
for Fm=1:frame
    for mM=1:M
        for nN=1:N
            for nt=1:tt
                mse= mse + (double(A(mM,nN,nt,Fm))-double(AB(mM,nN,nt,Fm)))^2;
            end
        end
    end
end
mse=mse/(M*N*tt*frame);
P=10*log10(255^2/mse);