% 做动画 gif 的模板
%
%   created by PH at 2014-06-19:1557
% Copyright (c) 2014-2015 Hao Peng (AstroH.Peng@gmail.com). All rights reserved.

function save_gif(figure_handel, filename)
movietimer = tic;

set(figure_handel,'MenuBar', 'none');

kk = 1;
M = 100;
az = linspace(-38,-38+360,M+1);
el = linspace(30,-30,M/2+1); el = [el, linspace(-30,30,M/2+1)];

for ii = 1:M % 画三维
    % rotate figure
    set(gca,'View',[az(ii),el(ii)]);
    
    GifData = getframe(gcf);
    if ii == 1
        [X(:,:,1,kk),Map] = rgb2ind(GifData.cdata, 256);
    else
        X(:,:,1,kk) = rgb2ind(GifData.cdata, Map);
    end
    kk = kk + 1;
end
imwrite(X,Map,filename,'LoopCount',Inf,'DelayTime',0.1);

toc(movietimer);