
PlotProps = getProperties('Powerpoint');

%% plotConfettiSpaghetti

load('PxN.mat', 'Data', 'nLabels', 'Stats')

figure('units','centimeters','position',[0 0 PlotProps.Figure.Width*.5 PlotProps.Figure.Height*.5])
plotConfettiSpaghetti(Data, Stats, nLabels, [], PlotProps)
title('plotConfettiSpaghetti()', 'FontSize', PlotProps.Text.TitleSize)