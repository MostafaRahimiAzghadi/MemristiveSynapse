

%%%%%%%% Pre_Pos spike pairs with different frequencies

function lerns = pairfreq(param)

	th=param(5);
	dx=0.01;
	delta_t=10;
	alp=param(6);
	freq = [1 10 20 40 50];
	
	pair_num = 2;  % This can be 60, but in that case the optimization should be done again and optimized values will be different. 
	lerns = zeros(1,2*length(freq));

	for j=1:length(freq)
		for i=1:(pair_num-1)
			bounds=(1000/freq(j))*pair_num+100;
			x=[-100:dx:bounds];
			
			% This part is basically to make the mult output. 
			triplet_pos_pre = mult(f_actP_triplet_pos(x-delta_t-((1000/freq(j)))*(i-1),param(3),param(4)).*f_actP_pre(x-((1000/freq(j)))-((1000/freq(j)))*(i-1),33.7,16.8,param(2),param(1)));
			sec_pos = f_actP_pos(x-delta_t-((1000/freq(j)))-((1000/freq(j)))*(i-1),16.8,33.7,param(1),param(2));
			for k=1:length(triplet_pos_pre)
				if sec_pos(k) <= 0 
					triplet_pos_pre(k)=0;
				end
			end		
			
			lern(i) = area_th(f_actP_pos(x-delta_t-((1000/freq(j)))*(i-1),16.8,33.7,param(1),param(2))-f_actP_pre(x-((1000/freq(j)))*(i-1),33.7,16.8,param(2),param(1)) ...
							+f_actP_pos(x-delta_t-((1000/freq(j)))*(i-1),16.8,33.7,param(1),param(2))-f_actP_pre(x-((1000/freq(j)))-((1000/freq(j)))*(i-1),33.7,16.8,param(2),param(1)) ...
							+f_actP_pos(x-delta_t-((1000/freq(j)))-((1000/freq(j)))*(i-1),16.8,33.7,param(1),param(2))-f_actP_pre(x-((1000/freq(j)))-((1000/freq(j)))*(i-1),33.7,16.8,param(2),param(1)) ...
							+triplet_pos_pre ... 
							,th,dx,alp);		
			lerns(j) = lerns(j) + lern(i);		
			%figure;
			%plot(f_actP_pos(x-delta_t-((1000/freq(j)))*(i-1),16.8,33.7,param(1),param(2)));
			%hold on;
			%plot(f_actP_pre(x-((1000/freq(j)))*(i-1),33.7,16.8,param(2),param(1)),'r');
			%plot(f_actP_pre(x-((1000/freq(j)))-((1000/freq(j)))*(i-1),33.7,16.8,param(2),param(1)),'r');		
			%plot(f_actP_pos(x-delta_t-((1000/freq(j)))-((1000/freq(j)))*(i-1),16.8,33.7,param(1),param(2)));
			%plot(f_actP_triplet_pos(x-delta_t-((1000/freq(j)))*(i-1),param(3),param(4)));
			%plot(triplet_pos_pre,'m');			
		end
	end	
	
	delta_t=-10;
	
	for j=1:length(freq)
		for i=1:(pair_num-1)
			bounds=(1000/freq(j))*pair_num+100;
			x=[-100:dx:bounds];
			
			% This part is basically to make the mult output. 
			triplet_pos_pre = mult(f_actP_triplet_pos(x-delta_t-((1000/freq(j)))*(i-1),param(3),param(4)).*f_actP_pre(x-((1000/freq(j)))*(i-1),33.7,16.8,param(2),param(1)));
			sec_pos = f_actP_pos(x-delta_t-((1000/freq(j)))-((1000/freq(j)))*(i-1),16.8,33.7,param(1),param(2));
			for k=1:length(triplet_pos_pre)
				if sec_pos(k) <= 0 
					triplet_pos_pre(k)=0;
				end
			end				
			
			
			lern(i) = area_th(f_actP_pos(x-delta_t-((1000/freq(j)))*(i-1),16.8,33.7,param(1),param(2))-f_actP_pre(x-((1000/freq(j)))*(i-1),33.7,16.8,param(2),param(1)) ...
							+f_actP_pos(x-delta_t-((1000/freq(j)))*(i-1),16.8,33.7,param(1),param(2))-f_actP_pre(x-((1000/freq(j)))-((1000/freq(j)))*(i-1),33.7,16.8,param(2),param(1)) ...
							+f_actP_pos(x-delta_t-((1000/freq(j)))-((1000/freq(j)))*(i-1),16.8,33.7,param(1),param(2))-f_actP_pre(x-((1000/freq(j)))-((1000/freq(j)))*(i-1),33.7,16.8,param(2),param(1)) ...
							+triplet_pos_pre ... 
							 ,th,dx,alp);			
			lerns(j+length(freq)) = lerns(j+length(freq)) + lern(i);				 
			%figure;
			%plot(f_actP_pos(x-delta_t-((1000/freq(j)))*(i-1),16.8,33.7,param(1),param(2)));
			%hold on;
			%plot(f_actP_pre(x-((1000/freq(j)))*(i-1),33.7,16.8,param(2),param(1)),'r');
			%plot(f_actP_pre(x-((1000/freq(j)))-((1000/freq(j)))*(i-1),33.7,16.8,param(2),param(1)),'r');		
			%plot(f_actP_pos(x-delta_t-((1000/freq(j)))-((1000/freq(j)))*(i-1),16.8,33.7,param(1),param(2)));
			%plot(f_actP_triplet_pos(x-delta_t-((1000/freq(j)))*(i-1),param(3),param(4)));			
			%plot(triplet_pos_pre,'m');						
		end
	end		