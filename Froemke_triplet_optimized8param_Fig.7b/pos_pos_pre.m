

%%%%%%%% pos_pos_pre

function lern = pos_pos_pre(param) 

	th=param(7);
	% dx=0.1;
	dx=0.01;
	bounds=100; % Pre and postsynaptic spikes duration starts at -bounds and ends at +bounds
	x=[-bounds:dx:bounds];
	delta_t1=[1 1 1 1 1 1 5 5 5 5 5 10 10 10 10 15 15 15 20 20 25]; %%% delta_t1=t_pos1 - t_pre;
	delta_t2=[5 10 15 20 25 30 10 15 20 25 30 15 20 25 30 20 25 30 25 30 30];   %%% delta_t2=t_pos2 - t_pre;
	alp=param(8);


	for i=1:length(delta_t1)
	   lern(i) = area_th(f_actP_pos(x,param(1),param(2),param(3),param(4))-f_actP_pre(x-(delta_t2(i)+delta_t1(i)),param(2),param(1),param(4),param(3)) ...
						+f_actP_pos(x-delta_t1(i),param(1),param(2),param(3),param(4))-f_actP_pre(x-(delta_t2(i)+delta_t1(i)),param(2),param(1),param(4),param(3)) ...
						,th,dx,alp);
						
						%figure;
						%hold on;
						%plot(f_actP_pos(x,param(1),param(2),param(3),param(4)));
						%plot(f_actP_pre(x-(delta_t2(i)+delta_t1(i)),param(2),param(1),param(4),param(3)),'r');
						%plot(f_actP_pos(x-delta_t1(i),param(1),param(2),param(3),param(4)));
						%plot(f_actP_pos(x,param(1),param(2),param(3),param(4))-f_actP_pre(x-(delta_t2(i)+delta_t1(i)),param(2),param(1),param(4),param(3)),'g');
						%plot(f_actP_pos(x-delta_t1(i),param(1),param(2),param(3),param(4))-f_actP_pre(x-(delta_t2(i)+delta_t1(i)),param(2),param(1),param(4),param(3)),'g');
						
	end









