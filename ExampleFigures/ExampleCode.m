
PlotProps = getProperties('Powerpoint');

%% plotConfettiSpaghetti

load('PxN.mat', 'Data', 'nLabels', 'Stats')

figure('units','centimeters','position',[0 0 PlotProps.Figure.Width*.5 PlotProps.Figure.Height*.5])
plotConfettiSpaghetti(Data, Stats, nLabels, [], PlotProps)
title('plotConfettiSpaghetti()', 'FontSize', PlotProps.Text.TitleSize)


%% plotSpaghettiOs

load('PxNxM.mat', 'Data', 'nLabels', 'Stats')

figure('units','centimeters','position',[0 0 PlotProps.Figure.Width*.2 PlotProps.Figure.Height*.5])
plotSpaghettiOs(Data, Stats, 1, mLabels, {}, [], PlotProps)
padAxis('y', .05)
title('plotSpahettiOs()', 'FontSize', PlotProps.Text.TitleSize)