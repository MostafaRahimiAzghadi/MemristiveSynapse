

%%%%%%%% Pre_Pos spike pairs with different frequencies

function lerns = pairfreq(param)

	th=param(5);
	dx=0.01;
	delta_t=10;
	alp=param(6);
	freq = [1 10 20 40 50];
	
	pair_num = 2;
	lerns = zeros(1,2*length(freq));

	for j=1:length(freq)
		for i=1:(pair_num-1)
			bounds=(1000/freq(j))*pair_num+100;
			x=[-100:dx:bounds];
			lern(i) = area_th(f_actP_pos(x-delta_t-((1000/freq(j)))*(i-1),param(1),param(2),param(3),param(4))-f_actP_pre(x-((1000/freq(j)))*(i-1),param(2),param(1),param(4),param(3)) ...
							+f_actP_pos(x-delta_t-((1000/freq(j)))*(i-1),param(1),param(2),param(3),param(4))-f_actP_pre(x-((1000/freq(j)))-((1000/freq(j)))*(i-1),param(2),param(1),param(4),param(3)) ...
							+f_actP_pos(x-delta_t-((1000/freq(j)))-((1000/freq(j)))*(i-1),param(1),param(2),param(3),param(4))-f_actP_pre(x-((1000/freq(j)))-((1000/freq(j)))*(i-1),param(2),param(1),param(4),param(3)) ...
							 ,th,dx,alp);		
			lerns(j) = lerns(j) + lern(i);				 
			%plot(f_actP_pos(x-delta_t-((1000/freq(j)))*(i-1),param(1),param(2),param(3),param(4)));
			%hold on;
			%plot(f_actP_pre(x-((1000/freq(j)))*(i-1),param(2),param(1),param(4),param(3)),'r');
			%plot(f_actP_pre(x-((1000/freq(j)))-((1000/freq(j)))*(i-1),param(2),param(1),param(4),param(3)),'r');		
			%plot(f_actP_pos(x-delta_t-((1000/freq(j)))-((1000/freq(j)))*(i-1),param(1),param(2),param(3),param(4)));			
		end
	end	
	
	delta_t=-10;
	
	for j=1:length(freq)
		for i=1:(pair_num-1)
			bounds=(1000/freq(j))*pair_num+100;
			x=[-100:dx:bounds];
			lern(i) = area_th(f_actP_pos(x-delta_t-((1000/freq(j)))*(i-1),param(1),param(2),param(3),param(4))-f_actP_pre(x-((1000/freq(j)))*(i-1),param(2),param(1),param(4),param(3)) ...
							+f_actP_pos(x-delta_t-((1000/freq(j)))*(i-1),param(1),param(2),param(3),param(4))-f_actP_pre(x-((1000/freq(j)))-((1000/freq(j)))*(i-1),param(2),param(1),param(4),param(3)) ...
							+f_actP_pos(x-delta_t-((1000/freq(j)))-((1000/freq(j)))*(i-1),param(1),param(2),param(3),param(4))-f_actP_pre(x-((1000/freq(j)))-((1000/freq(j)))*(i-1),param(2),param(1),param(4),param(3)) ...
							 ,th,dx,alp);		
			lerns(j+length(freq)) = lerns(j+length(freq)) + lern(i);				 
			%plot(f_actP_pos(x-delta_t-((1000/freq(j)))*(i-1),param(1),param(2),param(3),param(4)));
			%hold on;
			%plot(f_actP_pre(x-((1000/freq(j)))*(i-1),param(2),param(1),param(4),param(3)),'r');
			%plot(f_actP_pre(x-((1000/freq(j)))-((1000/freq(j)))*(i-1),param(2),param(1),param(4),param(3)),'r');		
			%plot(f_actP_pos(x-delta_t-((1000/freq(j)))-((1000/freq(j)))*(i-1),param(1),param(2),param(3),param(4)));			
		end
	end		