B=64;
U=8;
a=randn(B,U);
b=randn(B,U);
H = sqrt(0.5) .* (a + 1i .* b);
G=H'*H;
G1=mimo_gram_fixpt(H);
err=G-G1.double;
X=abs(norm(err,"fro"))/abs(norm(G,"fro"));
