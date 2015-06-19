% use get_min_perp.m to plot some interesting heat maps
 
clear all
close all
 
N = 1000;
x = 0;
y = 0;
 
lower_x = min(x) -5; upper_x = max(x) +5; % for sensible window size
lower_y = min(y) -5; upper_y = max(y) +5;
[X Y] = meshgrid(linspace(lower_x, upper_x, N),linspace(lower_y, upper_y, N));
% get minimum perpendicular distance
dist = get_min_perp(x,y,X,Y,N);
 
% plot results from get_min_perp for (0,0)
figure
h=pcolor(X,Y,dist);
set(h,'EdgeColor','none')
set(gcf,'Renderer','Zbuffer')
colormap(hot)
colorbar
 
% define a probability distribution
lognormal = @(X)((1./(X*sqrt(2*pi))).*exp(-(log(X)).^2/2));
 
% log_prob = lognormal(dist);
% gauss_prob = gauss(dist);
% prob = log_prob.*gauss_prob;
 
 
figure
h=pcolor(X,Y,sin(2*dist));
set(h,'EdgeColor','none')
set(gcf,'Renderer','Zbuffer')
colormap(winter)
colorbar
hold on
 
x = linspace(0,5*pi,50);
y = sin(x);
 
lower_x = min(x); upper_x = max(x);
lower_y = min(y); upper_y = max(y);
[X Y] = meshgrid(linspace(lower_x, upper_x, N),linspace(lower_y, upper_y, N));
dist = get_min_perp(x,y,X,Y,N);
 
figure
h=pcolor(X,Y,dist);
set(h,'EdgeColor','none')
set(gcf,'Renderer','Zbuffer')
colormap(hot)
colorbar
 
figure
h=pcolor(X,Y,lognormal(5*dist));
set(h,'EdgeColor','none')
set(gcf,'Renderer','Zbuffer')
colormap(winter)
colorbar
hold on
 
x = rand(1,10);
y = rand(1,10);
 
lower_x = min(x); upper_x = max(x);
lower_y = min(y); upper_y = max(y);
[X Y] = meshgrid(linspace(lower_x, upper_x, N),linspace(lower_y, upper_y, N));
dist = get_min_perp(x,y,X,Y,N);
 
figure
h=pcolor(X,Y,dist);
set(h,'EdgeColor','none')
set(gcf,'Renderer','Zbuffer')
colormap(hot)
colorbar
 
figure
h=pcolor(X,Y,lognormal(dist+1));
set(h,'EdgeColor','none')
set(gcf,'Renderer','Zbuffer')
colormap(winter)
colorbar
hold on

