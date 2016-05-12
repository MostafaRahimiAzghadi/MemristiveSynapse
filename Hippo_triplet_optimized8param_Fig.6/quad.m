

%%%%%%%% Quadruplet of spikes
function lern = quad(param)

	th=param(7);
	% dx=0.1;
	dx=0.01;
	bounds=110; % Pre and postsynaptic spikes duration starts at -bounds and ends at +bounds
	x=[-bounds:dx:bounds];
	T_pos=[83.7 20];  
	alp=param(8);


	for i=1:length(T_pos)
	   lern(i) = area_th(f_actP_pos(x,param(1),param(2),param(3),param(4))-f_actP_pre(x-5,param(2),param(1),param(4),param(3)) ...
						+f_actP_pos(x,param(1),param(2),param(3),param(4))-f_actP_pre(x-T_pos(i),param(2),param(1),param(4),param(3)) ...
						+f_actP_pos(x-T_pos(i)-5,param(1),param(2),param(3),param(4))-f_actP_pre(x-T_pos(i),param(2),param(1),param(4),param(3)) ...
						+mult(bounds,dx,f_actP_triplet_pos(x,param(5),param(6)).*f_actP_pre(x-T_pos(i),param(2),param(1),param(4),param(3)),T_pos(i),T_pos(i)+5) ...
						,th,dx,alp);
						
						%figure;
						%hold on;
						%plot(f_actP_pos(x,param(1),param(2),param(3),param(4)));
						%plot(f_actP_pre(x-5,param(2),param(1),param(4),param(3)),'r');
						%plot(f_actP_pre(x-T_pos(i),param(2),param(1),param(4),param(3)),'r');
						%plot(f_actP_pos(x-T_pos(i)-5,param(1),param(2),param(3),param(4)));
						%plot(mult(bounds,dx,f_actP_triplet_pos(x,param(5),param(6)).*f_actP_pre(x-T_pos(i),param(2),param(1),param(4),param(3)),T_pos(i),T_pos(i)+5),'m');
									
	end










