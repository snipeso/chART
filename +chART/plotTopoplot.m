function plotTopoplot(Data, Stats, Chanlocs, CLims, CLabel, ColormapName, PlotProps)
% plotTopoplot(Data, Stats, Chanlocs, CLims, CLabel, Colormap, PlotProps)

% pretty way of using EEGLAB's topoplot function. This is not my own plot.
% Maybe one day it will be.

% Data is a Ch x 1 matrix. If CLims is empty, uses "minmax". Colormap is
% string.
% if Stats is not empty, will plot little white markers for significant
% channels.

if numel(CLims) ~= 2
    CLims = 'minmax';
    SetCLims = true;
else
    SetCLims = false;
end

Indexes = 1:numel(Chanlocs);

Chanlocs = chART.utils.shift_channel_locations(Chanlocs, .06, 'y'); % little adjustment to center the chanlocs better
Colormap = chART.utils.resize_colormap(PlotProps.Color.Maps.(ColormapName), PlotProps.Color.Steps.(ColormapName));

if isempty(Stats)
    topoplot(Data, Chanlocs, 'style', 'map', 'headrad', 'rim', 'whitebk', 'on', ...
        'electrodes', 'on',  'maplimits', CLims, 'gridscale', PlotProps.External.EEGLAB.TopoRes, 'colormap', Colormap);
else
    topoplot(Data, Chanlocs, 'maplimits', CLims, 'whitebk', 'on', 'colormap', Colormap,  ...
        'style', 'map',  'plotrad', .73, 'headrad', 'rim', 'gridscale',   PlotProps.External.EEGLAB.TopoRes, ...
        'electrodes', 'on', 'emarker2', {Indexes(logical(Stats.sig)), 'o', 'w',  PlotProps.External.EEGLAB.MarkerSize, .05});

    %     topoplot(Data, Chanlocs, 'maplimits', CLims, 'whitebk', 'on', ...
    %         'style', 'map',  'plotrad', .73, 'headrad', 'rim', 'gridscale',   PlotProps.External.EEGLAB.TopoRes, ...
    %         'electrodes', 'on', 'colormap', Colormap);
end


xlim([-.55 .55])
ylim([-.55 .6])

setAxisProperties(PlotProps)

A = gca;
set(A.Children, 'LineWidth', PlotProps.External.EEGLAB.Line.Width)
if PlotProps.External.EEGLAB.MarkerSize/2 < 1
    A.Children(2).MarkerSize = 1; % make dots really small
else
    A.Children(2).MarkerSize = PlotProps.External.EEGLAB.MarkerSize/2;
end
A.Children(1).MarkerSize = PlotProps.External.EEGLAB.MarkerSize;

if ~isempty(CLabel)
    h = colorbar;
    h.TickLength = 0;
    ylabel(h, CLabel, 'FontName', PlotProps.Text.FontName, 'FontSize', PlotProps.Text.LegendSize) % text style needs to be specified for label, because its weird
end

if SetCLims && strcmp(ColormapName, 'Divergent')
    CLims = clim;
    CLims = [-abs(max(CLims)), abs(max(CLims))];
    clim(CLims)
end


set(gca, 'Colormap', Colormap)