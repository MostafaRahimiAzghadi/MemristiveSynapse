

%%%%%%%% Quadruplet of spikes
function lern = quad1(param)

	th=param(7);
	% dx=0.1;
	dx=0.01;
	bounds=150; % Pre and postsynaptic spikes duration starts at -bounds and ends at +bounds
	x=[-bounds:dx:bounds];
	T_pos=[-90:0.5:-5];  
	alp=param(8);


	for i=1:length(T_pos)
	   lern(i) = area_th(f_actP_pos(x-5,param(1),param(2),param(3),param(4))-f_actP_pre(x,param(2),param(1),param(4),param(3)) ...
						+f_actP_pos(x+T_pos(i),param(1),param(2),param(3),param(4))-f_actP_pre(x,param(2),param(1),param(4),param(3)) ...
						+f_actP_pos(x+T_pos(i),param(1),param(2),param(3),param(4))-f_actP_pre(x-5+T_pos(i),param(2),param(1),param(4),param(3)) ...
						,th,dx,alp);
						
				
	end










