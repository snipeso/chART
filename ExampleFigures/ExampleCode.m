
PlotProps = load_plot_properties('Powerpoint');
Destination = 'C:\Users\colas\Projects\chART\ExampleFigures';

%% plotConfettiSpaghetti

load('PxN.mat', 'Data', 'nLabels', 'Stats')

figure('units','centimeters','position',[0 0 PlotProps.Figure.Width*.5 PlotProps.Figure.Height*.5])
plotConfettiSpaghetti(Data, Stats, nLabels, [], PlotProps)
Title = 'plotConfettiSpaghetti()';
title(Title, 'FontSize', PlotProps.Text.TitleSize)

chART.utils.save_figure(Title, Destination, PlotProps)

%% plotSpaghettiOs

load('PxNxM.mat', 'Data', 'nLabels', 'Stats')

figure('units','centimeters','position',[0 0 PlotProps.Figure.Width*.2 PlotProps.Figure.Height*.5])
plotSpaghettiOs(Data, Stats, 1, mLabels, {}, [], PlotProps)
chART.utils.pad_axis('y', .05)
Title = 'plotSpahettiOs()';
title(Title, 'FontSize', PlotProps.Text.TitleSize)

chART.utils.save_figure(Title, Destination, PlotProps)

%% plotBubbles

load('PxCh.mat', 'Chanlocs', 'Stats')

Sizes = normalize(Stats.hedgesg, 'range', [.1 300]);

figure('units','centimeters','position',[0 0 PlotProps.Figure.Height*.5 PlotProps.Figure.Height*.5])
plotBubbles(Stats.t, Chanlocs, 'rad', Sizes, {}, PlotProps)

Title = 'plotBubbles()';
title(Title, 'FontSize', PlotProps.Text.TitleSize)

chART.utils.save_figure(Title, Destination, PlotProps)