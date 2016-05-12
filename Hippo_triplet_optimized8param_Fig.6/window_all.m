

%%%%%%%% Pre_Pos spikes only for generating STDP learning window
function lern = window_all(param)

	th=param(7);
	dx=0.01;
	bounds=100;
	x=[-bounds:dx:bounds];
	delta_t=[-bounds:0.5:bounds];
	alp=param(8);

	for i=1:length(delta_t)
	   lern(i) = area_th(f_actP_pos(x-delta_t(i),param(1),param(2),param(3),param(4))-f_actP_pre(x,param(2),param(1),param(4),param(3)),th,dx,alp);			
					
	end
