% A simple demonstration of extracting cross of two surfaces
%
% Author: Hao Peng (AstroH.Peng@gmail.com)
% Date: 2018/12/21 14:56 UTC-5
% Updated: 2019/01/16 21:58 UTC-5

%%
clear;
gridsize = 100;
alphaspan = linspace(-pi,pi,gridsize+1);
betaspan = linspace(-pi/2,pi/2,gridsize+1);

[alpha,beta]=meshgrid(alphaspan,betaspan);

% shared functions
z1fun = @(x,y)(x).^2+2*(y).^2;
z2fun = @(x,y)6-2*(x).^2-(y).^2;

% find rho
rho1 = nan(size(alpha));
rho2 = rho1;
for ii = 1:numel(alpha)
    rho1(ii) = fminbnd(@(r) abs( r*sin(beta(ii)) + 3 - z1fun(r*cos(beta(ii))*cos(alpha(ii)),r*cos(beta(ii))*sin(alpha(ii))) ),0,20);
    rho2(ii) = fminbnd(@(r) abs( r*sin(beta(ii)) + 3 - z2fun(r*cos(beta(ii))*cos(alpha(ii)),r*cos(beta(ii))*sin(alpha(ii))) ),0,20);
end
rho1((abs(rho1)<1e-3)) = nan;
rho2((abs(rho2)<1e-3)) = nan;

rho = nan(size(rho1));
id = isnan(rho1) & ~isnan(rho2); rho(id) = rho2(id);
id = ~isnan(rho1) & isnan(rho2); rho(id) = rho1(id);
id = ~isnan(rho1) & ~isnan(rho2) & rho1<rho2; rho(id) = rho1(id);
id = ~isnan(rho1) & ~isnan(rho2) & rho1>rho2; rho(id) = rho2(id);


%%
figure(31);
set(gcf,'Position',[100,200,400,400]);
clf;
colormap('jet');

x = rho.*cos(beta).*cos(alpha);
y = rho.*cos(beta).*sin(alpha);
z = rho.*sin(beta) + 3;
s1 = surf(x,y,z,x,'LineStyle','none'); hold on;
s1.FaceColor = 'interp';
s1.FaceLighting = 'gouraud';
camlight;

a1 = gca;
title(a1, 'parametric solution')
xlabel('x'); ylabel('y'); zlabel('z'); axis tight; a1.DataAspectRatio = [1,1,5];
zlim(a1,[-2,8]); a1.XTick = -2:1:2; a1.YTick = -2:1:2; a1.ZTick = -6:2:12;
grid on; box on; 

save_gif(gcf, 'parametric.gif');
