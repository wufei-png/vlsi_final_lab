function gram=mimo_gram(H)
H1=H;
H2=H';
Hi1=imag(H2)
Hr1=real(H2)
Hi2=imag(H1);
Hr2=real(H1);
G_tmp=zeros(64,1,'like',H(1));
gram=zeros(8,8,'like',H(1));
for x=1:8
    for y=1:8
        for n=1:64
            a=Hr1(x,n);b=Hi1(x,n);
            c=Hr2(n,y);d=Hi2(n,y);
            t1=a*c;
            t2=b*d;
            t3=a*d;
            t4=c*b;
            G_tmp(n)=t1-t2+(t3+t4)*1i;
            gram(x,y)=gram(x,y)+G_tmp(n);
        end
    end
end
end