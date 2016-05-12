function out = mult(bounds,dx,y,low_bound,up_bound)

n=length(y); % number of points in the domain of this function [-80:0.01:80]. We need only a specific number of points in the middle of the range low_bound and up_bound between delta_t1 and delta_t2

low_bound_index=length([-bounds:dx:low_bound]);
up_bound_index=length([-bounds:dx:up_bound]);

for i=1:n 
	if ( i >= up_bound_index | i <= low_bound_index) 
			out(i,1)=0;
		else
			out(i,1)=y(i);
		end
	end
end