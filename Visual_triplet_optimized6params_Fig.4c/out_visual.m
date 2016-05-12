%% Author: Mostafa Rahimi Azghadi, School of Electrical and Information Engineering,
%% The University of Sydney, Sydney, Australia 
%% Date: 10/05/2015

%% Visual cortex experiments of Sjostrom et al. 2001, Neuron and modelling results from Pfister and Gerstnet 2006 papers.
%% Supplementary material to the paper "A Hybrid CMOS-memristor Neuromorphic Synapse".

%% Here six parameters were optimized. See the paper for more details.  
%% Required params can be copied from data1.txt file in this directory. 

function NMSE=out_visual(param)

	fid=fopen('data1','w+');
	fprintf(fid,'% d',param);
	fclose(fid);

	dw=zeros(1,10);

	dw=pairfreq(param);

	dw
	tmp=0; p=10;
	x=[1 10 20 40 50];
	expval=[-0.04 0.14 0.29 0.53 0.56 -0.29 -0.41 -0.34 0.56 0.75];
	sem=[0.05 0.1 0.14 0.11 0.26 0.08 0.11 0.1 0.32 0.19];
	
	for i=1:10
		tmp=tmp+(((expval(i)-dw(i))/sem(i))^2);
	end
	NMSE=(1/p)*tmp;


 	% Plot
 	figure; 
	hold on;
	h=plot(x,dw(1:5),'ro-');
 	set(h,'linewidth',2);
 
 	h=errorbar(x,expval(1:5),sem(1:5),'ko-');
 	set(h,'linewidth',1.5);
 
 
 	h=plot(x,dw(6:10),'ro-.');
	set(h,'linewidth',2);
 
 	h=errorbar(x,expval(6:10),sem(6:10),'ko-.');
 	set(h,'linewidth',2);
 
 	% Plot configurations
 	set(gca,'fontsize',20,'linewidth',2);
 	axis tight
 	xlabel('\rho [Hz]','fontsize',20);
 	ylabel('\DeltaW [V]','fontsize',20);
 	box on
 
	hleg1 = legend('PSTDP circuit (\Deltat=10ms)','Experiments (\Deltat=10ms)','PSTDP circuit (\Deltat=-10ms)','Experiments (\Deltat=-10ms)');
	set(hleg1,'Location','NorthWest')
 	set(hleg1,'fontsize',12)



	
	