%******************************************************************************
%浮点型算法
B=64;
U=8;
a=randn(B,U);
b=randn(B,U);
H = sqrt(0.5) .* (a + 1i .* b);
G=H'*H;%Basic algorithm
%********************************************************************************
%定点量化
% H=table2array(Href);
fm = get_fimath();
H2=H';
% H_hex=fi(H2,1,16,8).hex;
Hi1=fi(imag(H2),1,16,8,fm);
Hr1=fi(real(H2),1,16,8,fm);
Hi2=fi(imag(H1),1,16,8,fm);
Hr2=fi(real(H1),1,16,8,fm);
G1=quantizenumeric(zeros(8,8),1,16,8,'fix');
% G_tmp=fi(zeros,1,16,8);
for x=1:8
    for y=1:8
        for n=1:64
            t1=quantizenumeric(Hr1(x,n)*Hr2(n,y),1,16,8,'fix');t1x=fi(t1,1,16,8).hex;
            t2=quantizenumeric(Hi1(x,n)*Hi2(n,y),1,16,8,'fix');t2x=fi(t2,1,16,8).hex;
            t3=quantizenumeric(Hr1(x,n)*Hi2(n,y),1,16,8,'fix');t3x=fi(t3,1,16,8).hex;
            t4=quantizenumeric(Hi1(x,n)*Hr2(n,y),1,16,8,'fix');t4x=fi(t4,1,16,8).hex;
            G_tmp(n)=quantizenumeric(t1-t2+(t3+t4)*1i,1,16,8,'fix');
%           G_tmp(n)=H2(x,n)*H1(n,y);
            G_t=fi(G_tmp,1,16,8);
            Gtxt=G_t.hex;
        end
        writematrix(Gtxt,'Gtxt')
         G1(x,y)=sum(G_tmp(:));
    end
end
G2=fi(quantizenumeric(G1,1,16,8),1,16,8).hex;%验证16进制的正确
% CH=G-G1;%差值
% X1=norm(CH,2)/norm(G,2);
%****************************************************************************
% %需要的输出文件
I1=reshape(Hi1,512,1);
I2=I1.bin;
R1=reshape(Hr1,512,1);
R2=R1.bin;
writematrix(R2,'R.txt')
writematrix(I2,'I.txt')
writematrix(G2,'Gout.txt')
writematrix(H_hex,'H_in.txt')
writematrix(H,'H_ref.txt')
writematrix(G,'G.txt')


function fm = get_fimath()
	fm = fimath('RoundingMethod', 'Floor',...
	     'OverflowAction', 'Wrap',...
	     'ProductMode','FullPrecision',...
	     'MaxProductWordLength', 128,...
	     'SumMode','FullPrecision',...
	     'MaxSumWordLength', 128);
end
