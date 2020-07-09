% A simple demonstration of extracting cross of two surfaces
%
% Author: Hao Peng (AstroH.Peng@gmail.com)
% Date: 2018/12/21 14:56 UTC-5

%%
clear;
gridsize = 0.05;
xspan = -2:gridsize:2;
yspan = -2:gridsize:2;
zspan = -10:gridsize:15;

% shared functions
z1fun = @(x,y)x.^2+2*y.^2;
z2fun = @(x,y)6-2*x.^2-y.^2;
vfun = @(z,z1,z2)min(z-z1,z2-z);

%%% Visualize cross section line
[x_2d,y_2d]=meshgrid(xspan,yspan);
z1_2d = z1fun(x_2d,y_2d);
z2_2d = z2fun(x_2d,y_2d);
zdiff_2d = z1_2d - z2_2d;
C = contours(x_2d, y_2d, zdiff_2d, [0 0]);
xL = C(1, 2:end);
yL = C(2, 2:end);
zL = interp2(x_2d, y_2d, z1_2d, xL, yL);

%%% visulaize surface
[x,y,z] = meshgrid(xspan,yspan,zspan);
z1 = z1fun(x,y);
z2 = z2fun(x,y);
v = vfun(z,z1,z2);

%% show
figure(34);
set(gcf,'Position',[50,100,1200,1000]);
clf;

ax1 = subplot(2,2,1);
plot3(xL, yL, zL, 'Color', 'r', 'LineWidth', 3); hold on;
p = patch(isosurface(x,y,z,v,0,z),'FaceColor','interp');
p.LineStyle = 'none';
p.FaceLighting = 'gouraud';
grid on; box on;

ax2 = subplot(2,2,2);
p2 = plot3(xL, yL, zL, 'Color', 'r', 'LineWidth', 3); hold on;
p = patch(isosurface(x,y,z,v,0),'FaceColor','c'); 
camlight;
p.LineStyle = 'none';
p.FaceLighting = 'gouraud';
grid on; box on;

ax3 = subplot(2,2,3);
surf(x_2d,y_2d,z1_2d,'LineStyle','none');

ax4 = subplot(2,2,4);
surf(x_2d,y_2d,z2_2d,'LineStyle','none');

% link view
linkprop([ax1,ax2,ax3,ax4],{'CameraPosition','CameraUpVector'}); 
rotate3d on;