%% Author: Mostafa Rahimi Azghadi, School of Electrical and Information Engineering,
%% The University of Sydney, Sydney, Australia 
%% Date: 10/05/2015

%% Hippocampal experiments of Wang et al. 2005 and modelling results from Pfister and Gerstnet 2006 papers.
%% Supplementary material to the paper "A Hybrid CMOS-memristor Neuromorphic Synapse".

%% Here eight parameters were optimized. See the paper for more details.  
%% Required params can be copied from data1.txt file in this directory. 


function NMSE=out_hippo(param)

	fid=fopen('data1','w+');
	fprintf(fid,'% d',param);
	fclose(fid);

	dw=zeros(1,13);

	dw(1,5:8) = pre_pos_pre(param);

	dw(1,1:4) = pos_pre_pos(param);
	
	dw(1,9) = quad1(param);
	
	dw(1,10:11) = quad(param);
	
	dw(1,12:13) = window(param);

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%	
	
	tmp=0; p=13;
	expval=[0.33 0.34 0.22 0.29 -0.01 0.03 0.01 0.24 -0.003 0.06 0.21 0.25 -0.17];
	sem=[0.04 0.04 0.08 0.05 0.04 0.04 0.03 0.06 0.03 0.04 0.04 0.05 0.05; 0 0 0 0 0 0 0 0 0 0 0 0 0];
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	Triplet_posprepos_sem=[0.04 0; 0.04 0; 0.08 0; 0.05 0];
	posprepos=zeros(4,2);
	axis tight
	box on
	for k=1:4
	posprepos(k,1)=expval(k);
	posprepos(k,2)=dw(k);
	end
	subplot(2,2,4)
	barweb(posprepos(1:4,1:2),Triplet_posprepos_sem(1:4,1:2),.8,{'(-5,5)';'(-10,10)';'(-5,15)';'(-15,5)'});
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	Triplet_prepospre_sem=[0.04 0; 0.04 0; 0.03 0; 0.06 0];
	prepospre=zeros(4,2);
	for k=1:4
	prepospre(k,1)=expval(k+4);
	prepospre(k,2)=dw(k+4);
	end
	subplot(2,2,3)
	barweb(prepospre(1:4,1:2),Triplet_prepospre_sem(1:4,1:2),.8,{'(5,-5)';'(10,-10)';'(15,-5)';'(5,-15)'});
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	x_neg=[-90:0.5:-5];
	x_pos=[5:0.5:90];
	X=[-90 80 20];
	subplot(2,2,2)
	errorbar(X,expval(9:11),sem(9:11),'o');
	hold on;
	plot(X,dw(9:11),'*');
	hold on;
	plot(x_neg,quad1_all(param));
	hold on;
	plot(x_pos,quad_all(param));
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	xw=[-100:0.5:100];
	X=[10 -10];
	subplot(2,2,1)
	errorbar(X,expval(12:13),sem(12:13),'o');
	hold on;
	plot(X,dw(12:13),'*');
	hold on;
	plot(xw,window_all(param));
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	for i=1:13
		tmp=tmp+(((expval(i)-dw(i))/sem(1,i))^2);
	end
	dw
	NMSE=(1/p)*tmp;
end

 

