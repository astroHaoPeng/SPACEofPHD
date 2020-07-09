% A simple demonstration of extracting cross of two surfaces
%
% Author: Hao Peng (AstroH.Peng@gmail.com)
% Date: 2018/12/21 14:56 UTC-5
% Updated: 2019/01/16 21:58 UTC-5

%%
clear;
gridsize = 0.05;
xspan = -2:gridsize:2;
yspan = -2:gridsize:2;
zspan = -10:gridsize:15;

% shared functions
z1fun = @(x,y)x.^2+2*y.^2;
z2fun = @(x,y)6-2*x.^2-y.^2;
vfun = @(x,y,z)min(z-z1fun(x,y),z2fun(x,y)-z);

%%% Extract cross section line
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
v = vfun(x,y,z);

%% fun1 and fun2 separate
figure(21);
set(gcf,'Position',[100,200,256,460]);
clf;
a1 = subplot(211);
s1 = surf(a1, x_2d,y_2d,z1_2d,'LineStyle','none'); hold on;
xlabel('x'); ylabel('y'); zlabel('z'); axis tight; box on;

a2 = subplot(212);
s2 = surf(a2, x_2d,y_2d,z2_2d,'LineStyle','none'); hold on;
xlabel('x'); ylabel('y'); zlabel('z'); axis tight; box on;

title(a1, 'function #1')
title(a2, 'function #2')
a1.DataAspectRatio = [1,1,5];
a2.DataAspectRatio = [1,1,5];
colormap(a1,flip(jet(256),1));
colormap(a2,flip(copper(256),1));
s1.FaceAlpha = 0.8;
s2.FaceAlpha = 0.5;
s1.FaceColor = 'interp';
s2.FaceColor = 'interp';
linkprop([a1,a2],{'CameraPosition','CameraUpVector'}); 
zlim(a1,[0,12]); a1.XTick = -2:1:2; a1.YTick = -2:1:2; a1.ZTick = -6:2:12;
zlim(a2,[-6,6]); a2.XTick = -2:1:2; a2.YTick = -2:1:2; a2.ZTick = -6:2:12;

% save_gif(gcf, 'separate.gif');

%% fun1 and fun2 together
figure(22);
set(gcf,'Position',[100,200,256,256]);
clf;
c1 = z1_2d + max(z2_2d(:))*1.2;
c2 = z2_2d;
cmin = min(c2(:));
cmid = max(c2(:));
cmax = max(c1(:));
cp = [flip(copper(round(256*(cmid-cmin)/(cmax-cmin))),1); 
    flip(jet(round(256*(cmax-cmid)/(cmax-cmin))),1)];
colormap(cp);

a1 = gca;
s1 = surf(a1, x_2d,y_2d,z1_2d,c1,'LineStyle','none'); hold on;
s2 = surf(a1, x_2d,y_2d,z2_2d,c2,'LineStyle','none'); hold on;
plot3(xL, yL, zL, 'Color', 'b', 'LineWidth', 1); hold on;
xlabel('x'); ylabel('y'); zlabel('z'); axis tight; a1.DataAspectRatio = [1,1,5]; box on;

title(a1, 'functions #1 and #2')
% s1.FaceAlpha = 0.8;
% s2.FaceAlpha = 0.5;
s1.FaceColor = 'interp';
s2.FaceColor = 'interp';
zlim(a1,[-6,12]); a1.XTick = -2:1:2; a1.YTick = -2:1:2; a1.ZTick = -6:2:12;

save_gif(gcf, 'together.gif');

%% simple solution
figure(23);
set(gcf,'Position',[100,200,400,400]);
clf;

c1 = z1_2d + max(z2_2d(:))*1.2;
c2 = z2_2d;
cmin = min(c2(:));
cmid = max(c2(:));
cmax = max(c1(:));
cp = [flip(copper(round(256*(cmid-cmin)/(cmax-cmin))),1); 
    flip(jet(round(256*(cmax-cmid)/(cmax-cmin))),1)];
colormap(cp);

z1_2d_new = z1_2d; z1_2d_new( z1_2d > z2_2d ) = nan;
z2_2d_new = z2_2d; z2_2d_new( z1_2d > z2_2d ) = nan;
a1 = gca;
s1 = surf(a1, x_2d,y_2d,z1_2d_new,c1,'LineStyle','none'); hold on;
s2 = surf(a1, x_2d,y_2d,z2_2d_new,c2,'LineStyle','none'); hold on;
p2 = plot3(a1, xL, yL, zL, 'Color', 'b', 'LineWidth', 1); hold on;
xlabel('x'); ylabel('y'); zlabel('z'); axis tight; a1.DataAspectRatio = [1,1,5]; box on;

title(a1, 'simple solution')
% s1.FaceAlpha = 0.8;
% s2.FaceAlpha = 0.5;
s1.FaceColor = 'interp';
s2.FaceColor = 'interp';
zlim(a1,[-2,8]); a1.XTick = -2:1:2; a1.YTick = -2:1:2; a1.ZTick = -6:2:12;

save_gif(gcf, 'simple.gif');

%% better solution, single color
figure(24);
set(gcf,'Position',[100,200,400,400]);
clf;

colormap('jet');

a1 = gca;
plot3(xL, yL, zL, 'Color', 'b', 'LineWidth', 1); hold on;
fv = isosurface(x,y,z,v,0,z);
p = patch(fv,'FaceColor','interp');
p.LineStyle = 'none';
p.FaceLighting = 'gouraud';

xlabel('x'); ylabel('y'); zlabel('z'); axis tight; a1.DataAspectRatio = [1,1,5];
title(a1, 'better solution')
zlim(a1,[-2,8]); a1.XTick = -2:1:2; a1.YTick = -2:1:2; a1.ZTick = -6:2:12;
grid on; box on; 

save_gif(gcf, ['better_1_color.gif']);

%% better solution, light
figure(24);
set(gcf,'Position',[100,200,400,400]);
clf;

a1 = gca;
plot3(xL, yL, zL, 'Color', 'b', 'LineWidth', 1); hold on;
p = patch(isosurface(x,y,z,v,0),'FaceColor','c'); 
p.LineStyle = 'none';
p.FaceLighting = 'gouraud';
grid on; box on; 
camlight;

xlabel('x'); ylabel('y'); zlabel('z'); axis tight; a1.DataAspectRatio = [1,1,5];
title(a1, 'better solution')
zlim(a1,[-2,8]); a1.XTick = -2:1:2; a1.YTick = -2:1:2; a1.ZTick = -6:2:12;
grid on; box on; 

save_gif(gcf, ['better_1_color_light.gif']);

%% better solution, two color
figure(24);
set(gcf,'Position',[100,200,400,400]);
clf;

c1 = z1_2d + max(z2_2d(:))*1.2;
c2 = z2_2d;
cmin = min(c2(:));
cmid = max(c2(:));
cmax = max(c1(:));
cp = [flip(copper(round(256*(cmid-cmin)/(cmax-cmin))),1); 
    flip(jet(round(256*(cmax-cmid)/(cmax-cmin))),1)];
colormap(cp);

a1 = gca;
plot3(xL, yL, zL, 'Color', 'b', 'LineWidth', 1); hold on;
fv = isosurface(x,y,z,v,0);
z1fun_v_x = z1fun(fv.vertices(:,1),fv.vertices(:,2));
z2fun_v_x = z2fun(fv.vertices(:,1),fv.vertices(:,2));
tol = 1e-5;
while 1
    id1 = abs(fv.vertices(:,3)-z1fun_v_x) < tol;
    id2 = abs(fv.vertices(:,3)-z2fun_v_x) < tol;
    if sum(id1|id2)==length(fv.vertices)
        break;
    end
    tol = tol*10;
end
fv.facevertexcdata(id1,1) = fv.vertices(id1,3)+ max(z2_2d(:))*1.2;
fv.facevertexcdata(id2,1) = fv.vertices(id2,3);
p = patch('Vertices',fv.vertices,'Faces',fv.faces,'FaceVertexCData',fv.facevertexcdata,'FaceColor','flat');
p.LineStyle = 'none';
p.FaceLighting = 'gouraud';
xlabel('x'); ylabel('y'); zlabel('z'); axis tight; a1.DataAspectRatio = [1,1,5]; box on;
caxis([cmin,cmax]);

title(a1, 'better solution')
zlim(a1,[-2,8]); a1.XTick = -2:1:2; a1.YTick = -2:1:2; a1.ZTick = -6:2:12;
grid on; box on; 

% save_gif(gcf, 'better_2_color.gif');
