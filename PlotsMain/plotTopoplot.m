function plotTopoplot(Data, Stats, Chanlocs, CLims, CLabel, Colormap, PlotProps)
% plotTopoplot(Data, Stats, Chanlocs, CLims, CLabel, Colormap, PlotProps)

% pretty way of using EEGLAB's topoplot function. This is not my own plot.
% Maybe one day it will be.

% Data is a Ch x 1 matrix. If CLims is empty, uses "minmax". Colormap is
% string.
% if Stats is not empty, will plot little white markers for significant
% channels.

if numel(CLims) ~= 2
    CLims = 'minmax';
end

Indexes = 1:numel(Chanlocs);

Chanlocs = shiftTopoChannels(Chanlocs, .06, 'y'); % little adjustment to center the chanlocs better

if isempty(Stats)
    topoplot(Data, Chanlocs, 'style', 'map', 'headrad', 'rim', 'whitebk', 'on', ...
        'electrodes', 'on',  'maplimits', CLims, 'gridscale', PlotProps.External.EEGLAB.TopoRes);
else
%     topoplot(Data, Chanlocs, 'maplimits', CLims, 'whitebk', 'on', ...
%         'style', 'map',  'plotrad', .73, 'headrad', 'rim', 'gridscale',   PlotProps.External.EEGLAB.TopoRes, ...
%         'electrodes', 'on', 'emarker2', {Indexes(logical(Stats.sig)), 'o', 'w',  PlotProps.External.EEGLAB.MarkerSize, .05});

    topoplot(Data, Chanlocs, 'maplimits', CLims, 'whitebk', 'on', ...
        'style', 'map',  'plotrad', .73, 'headrad', 'rim', 'gridscale',   PlotProps.External.EEGLAB.TopoRes, ...
        'electrodes', 'on');
end


xlim([-.55 .55])
ylim([-.55 .6])
set(gca, 'FontName', PlotProps.Text.FontName, 'FontSize', PlotProps.Text.LegendSize)
A = gca;
set(A.Children, 'LineWidth', 1)

if ~isempty(CLabel)
    h = colorbar;
    h.TickLength = 0;
    ylabel(h, CLabel, 'FontName', PlotProps.Text.FontName, 'FontSize', PlotProps.Text.LegendSize) % text style needs to be specified for label, because its weird
end

Colormap = reduxColormap(PlotProps.Color.Maps.(Colormap), PlotProps.Color.Steps.(Colormap));
set(gca, 'Colormap', Colormap)