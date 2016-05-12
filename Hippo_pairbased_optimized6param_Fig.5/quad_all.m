

%%%%%%%% Quadruplet of spikes
function lern = quad(param)

	th=param(5);
	% dx=0.1;
	dx=0.01;
	bounds=150; % Pre and postsynaptic spikes duration starts at -bounds and ends at +bounds
	x=[-bounds:dx:bounds];
	T_pos=[5:0.5:90];	  
	alp=param(6);


	for i=1:length(T_pos)
	   lern(i) = area_th(f_actP_pos(x,param(1),param(2),param(3),param(4))-f_actP_pre(x-5,param(2),param(1),param(4),param(3)) ...
						+f_actP_pos(x,param(1),param(2),param(3),param(4))-f_actP_pre(x-T_pos(i),param(2),param(1),param(4),param(3)) ...
						+f_actP_pos(x-T_pos(i)-5,param(1),param(2),param(3),param(4))-f_actP_pre(x-T_pos(i),param(2),param(1),param(4),param(3)) ...
						,th,dx,alp);
				
	end










