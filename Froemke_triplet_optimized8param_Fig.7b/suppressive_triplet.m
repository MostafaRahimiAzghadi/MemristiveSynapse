%% Author: Mostafa Rahimi Azghadi, School of Electrical and Information Engineering,
%% The University of Sydney, Sydney, Australia 
%% Date: 10/05/2015

%% Suppressive STDP experiments of Froemke and Dan 2002 Nature paper
%% Supplementary material to the paper "A Hybrid CMOS-memristor Neuromorphic Synapse".

%% Here eight optimized parameters were used. See the paper for more details. 
%% Required params can be copied from data1.txt file in this directory. 

function suppressive_triplet(params)

dwrect=zeros(1,36);
dwtri=zeros(1,36);
mat=zeros(13,13);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%pre-pos-pos


dwtri=pre_pos_pos(params);

k=7; r=1;
for i=7:12
	for j=k:12
		mat(i,j)=dwtri(1,r);
        r=r+1;
    end
    k=k+1;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%pos-pos-pre

dwtri=pos_pos_pre(params);

%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=6; r=1;
for i=6:-1:1
	for j=1:k
		mat(j,i)=dwtri(1,r);
        r=r+1;
    end
    k=k-1;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%pos-pre-pos

dwrect=pos_pre_pos(params);

%%%%%%%%%%%%%%%%%%%%%%%%%%%
r=1;
for i=6:-1:1
	for j=7:12
		mat(i,j)=dwrect(1,r);
        r=r+1;
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mat
t1=[-30 -25 -20 -15 -10 -5 0 5 10 15 20 25 30];
t2=[-30 -25 -20 -15 -10 -5 0 5 10 15 20 25 30];
subplot(2,1,1);
pcolor(t2,t1,mat);
colormap(darkb2r(-1,1));
colorbar;
shading flat;

axis square

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dwrect=zeros(1,36);
dwtri=zeros(1,36);
mat=zeros(13,13);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%pre_pos_pre

	dwrect=pre_pos_pre(params);

%%%%%%%%%%%%%%%%%%%%%%%%%%

r=1;
for i=7:12
	for j=6:-1:1
		mat(i,j)=dwrect(1,r);
        r=r+1;
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% pre-pre-pos

dwtri=pre_pre_pos(params);

%%%%%%%%%%%%%%%%%%%%%%%%%
k=7; r=1;
for i=7:12
	for j=k:12
		mat(j,i)=dwtri(1,r);
        r=r+1;
    end
    k=k+1;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%pos-pre-pre

dwtri=pos_pre_pre(params);

%%%%%%%%%%%%%%%%%%%%%%%%%%
k=6; r=1;
for i=6:-1:1
	for j=1:k
		mat(i,j)=dwtri(1,r);
        r=r+1;
    end
    	k=k-1;
end

mat
t1=[-30 -25 -20 -15 -10 -5 0 5 10 15 20 25 30];
t2=[-30 -25 -20 -15 -10 -5 0 5 10 15 20 25 30];
subplot(2,1,2);
pcolor(t2,t1,mat);
colormap(darkb2r(-1,1));
colorbar;
shading flat;

axis square

end