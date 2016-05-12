function out = mult(y)

n=length(y); % number of points in the domain of this function [-80:0.01:80]. We need only a specific number of points in the middle of the range low_bound and up_bound between delta_t1 and delta_t2


out=zeros(n,1);

for i=1:n 
	if ( y(i) > 0 ) 
			out(i,1)=y(i);
		else
			out(i,1)=0;
		end
	end
end