clear;clc;
close all;



filename=['single_srr_y93.txt'];
A=importdata(filename);
x=A.data(:,1);
y=A.data(:,2);
z=A.data(:,3);
Ex_real=A.data(:,4);
Ey_real=A.data(:,5);
Ez_real=A.data(:,6);
Ex_imag=A.data(:,7);
Ey_imag=A.data(:,8);
Ez_imag=A.data(:,9);

nx=(length(x)).^0.5;ny=(length(y)).^0.5;nz=(length(z)).^0.5;
lx=4000;ly=4000;lz=50;
px=lx/(nx-1);py=ly/(ny-1);pz=lz/(nz-1);

Ex=Ex_real+1i*Ex_imag;
Ey=Ey_real+1i*Ey_imag;
Ez=Ez_real+1i*Ez_imag;
Ez=Ez.*exp(1i*pi/2);

Ex=reshape(Ex,ny,nx);
Ey=reshape(Ey,ny,nx);
Ez=reshape(Ez,ny,nx);

x=lx/2:-px:-lx/2;
y=-ly/2:py:ly/2;
[X,Y]=meshgrid(x,y);
% X=X.';
% Y=Y.';
P=(abs(Ez)).^2;
R=real(Ez);
x1=-lx/2:px:lx/2;
y1=-ly/2:py:ly/2;

[X1,Y1]=meshgrid(x1,y1);
figure;
g=pcolor(X,Y,P);
set(g,'LineStyle','none');
colorbar;
colormap(hot);
% figure;
% g=pcolor(X,Y,R);
% set(g,'LineStyle','none');
% colorbar;











% clear all;clc;
% filename=['1d_0 2800.txt'];
% A=importdata(filename);
% f=A.data(:,1);
% A1=A.data(:,2);
% 
% filename=['1d_2800 0.txt'];
% A=importdata(filename);
% A2=A.data(:,2);

% x=[0.199,0.049,0.218,0.294];
% y=[0.221,0.296,0.2,0.0443];
% lcp=[0.414,0.267,0.0827,0.33];
% rcp=[0.0827,0.33,0.414,0.267];
% figure
% plot(f,(A1/max(A1)).^1,f,(A2/max(A1)).^1);
% axis([0.3,1.1,0,1.2])
% 
% x=[0.192,0.0426,0.217,0.291];
% y=[0.217,0.291,0.192,0.0426];
% lcp=[0.412,0.258,0.0592,0.332];
% rcp=[0.0592,0.332,0.412,0.258];
% 
% f=[1,2,3,4];
% 
% x=x./max(A1);
% y=y./max(A1);
% lcp=lcp/sqrt(2)./max(A1);
% rcp=rcp/sqrt(2)./max(A1);
% 
% figure
% plot(f,x,'p',f,y,'^',f,lcp,'*',f,rcp,'s');
% axis([0,5,0,1.2]);

% filename=['eit 2500.txt'];
% A=importdata(filename);
% A2500=A.data(:,2);
% 
% filename=['eit 5000.txt'];
% A=importdata(filename);
% A5000=A.data(:,2);
% 
% filename=['eit 10000.txt'];
% A=importdata(filename);
% A10000=A.data(:,2);
% 
% filename=['eit 30000.txt'];
% A=importdata(filename);
% A30000=A.data(:,2);
% 
% filename=['eit 50000.txt'];
% A=importdata(filename);
% A50000=A.data(:,2);
% 
% A1=A1./max(A1);
% A2=A2./max(A1);
% 
% 
% figure
% plot(f,A1,f,A2);
% axis([0.4,1.1,0,1.2]);
