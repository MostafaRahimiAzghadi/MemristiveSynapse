function out = f_actP_pre(x,x1,x2,amp_n,amp_p)
n=length(x);
 
xop=x2*0.5;
xon=x1*0.5;

out=zeros(n,1);


i1=find(x>-x1&x<0);
out(i1)=amp_n*(exp(x(i1)/xon)-exp(-x1/xon))/(1-exp(-x1/xon));

i2=find(x>0&x<x2);
out(i2)=-amp_p*(exp(-x(i2)/xop)-exp(-x2/xop))/(1-exp(-x2/xop));