

%%%%%%%% pos_pos_pre

function lern = pos_pos_pre(param) 

	th=param(5);
	% dx=0.1;
	dx=0.01;
	bounds=100; % Pre and postsynaptic spikes duration starts at -bounds and ends at +bounds
	x=[-bounds:dx:bounds];
	delta_t1=[1 1 1 1 1 1 5 5 5 5 5 10 10 10 10 15 15 15 20 20 25]; %%% delta_t1=t_pos1 - t_pre;
	delta_t2=[5 10 15 20 25 30 10 15 20 25 30 15 20 25 30 20 25 30 25 30 30];   %%% delta_t2=t_pos2 - t_pre;
	alp=param(6);


	for i=1:length(delta_t1)
	   lern(i) = area_th(f_actP_pos(x,16.8,33.7,param(1),param(2))-f_actP_pre(x-(delta_t2(i)+delta_t1(i)),33.7,16.8,param(2),param(1)) ...
						+f_actP_pos(x-delta_t1(i),16.8,33.7,param(1),param(2))-f_actP_pre(x-(delta_t2(i)+delta_t1(i)),33.7,16.8,param(2),param(1)) ...
						,th,dx,alp);
						
						%figure;
						%hold on;
						%plot(f_actP_pos(x,16.8,33.7,param(1),param(2)));
						%plot(f_actP_pre(x-(delta_t2(i)+delta_t1(i)),33.7,16.8,param(2),param(1)),'r');
						%plot(f_actP_pos(x-delta_t1(i),16.8,33.7,param(1),param(2)));
						%plot(f_actP_pos(x,16.8,33.7,param(1),param(2))-f_actP_pre(x-(delta_t2(i)+delta_t1(i)),33.7,16.8,param(2),param(1)),'g');
						%plot(f_actP_pos(x-delta_t1(i),16.8,33.7,param(1),param(2))-f_actP_pre(x-(delta_t2(i)+delta_t1(i)),33.7,16.8,param(2),param(1)),'g');
						
	end









