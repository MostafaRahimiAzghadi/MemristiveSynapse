

%%%%%%%% Pre_Pos spikes only for generating STDP learning window
function lern = window(param)

	th=param(5);
	dx=0.01;
	bounds=100;
	x=[-bounds:dx:bounds];
	delta_t=[10,-10];
	alp=param(6);

	for i=1:length(delta_t)
	   lern(i) = area_th(f_actP_pos(x-delta_t(i),param(1),param(2),param(3),param(4))-f_actP_pre(x,param(2),param(1),param(4),param(3)),th,dx,alp);		   
					
	end

