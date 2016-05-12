function out = f_actP_triplet_pos(x,x2,amp_p)
n=length(x);

xop=x2*0.5;


if x2<0
    exit(0);
end

out=zeros(n,1);

i2=find(x>0&x<x2);
out(i2)=-amp_p*(exp(-x(i2)/xop)-exp(-x2/xop))/(1-exp(-x2/xop));