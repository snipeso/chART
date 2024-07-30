function eeglab_topoplot(Data, Chanlocs, Stats, CLims, CLabel, ColormapName, PlotProps)
arguments
    Data
    Chanlocs
    Stats = [];
    CLims = 'minmax';
    CLabel = '';
    ColormapName = 'Linear';
    PlotProps = chART.load_plot_properties();
end
% eeglab_topoplot(Data, Chanlocs, Stats, CLims, CLabel, ColormapName, PlotProps)
% pretty way of using EEGLAB's topoplot function. This is not my own plot.
% Maybe one day it will be.
% Data is a Ch x 1 matrix. If CLims is empty, uses "minmax". Colormap is
% string.
% if Stats is not empty, will plot little white markers for significant
% channels.

if strcmp(ColormapName, 'Divergent') && isempty(CLims)
    Lim = max(abs(Data));
    CLims = [-Lim, Lim];
elseif isempty(CLims) || strcmp(CLims, 'minmax')
    CLims = quantile(Data, [0 1]);
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
end

xlim([-.55 .55])
ylim([-.55 .6])

chART.set_axis_properties(PlotProps)

A = gca;
set(A.Children, 'LineWidth', PlotProps.External.EEGLAB.Line.Width)
if PlotProps.External.EEGLAB.MarkerSize/2 < 1
    A.Children(2).MarkerSize = 1; % make dots really small
else
    A.Children(2).MarkerSize = PlotProps.External.EEGLAB.MarkerSize/2;
end
A.Children(1).MarkerSize = PlotProps.External.EEGLAB.MarkerSize;


if isstring(CLims) && strcmp(ColormapName, 'Divergent')
    CLims = clim;
    CLims = [-abs(max(CLims)), abs(max(CLims))];
end

if ~isempty(CLabel)
    % chART.plot.vertical_colorbar(CLabel, PlotProps)
    colorbar off
    chART.plot.pretty_colorbar(ColormapName, CLims, CLabel, PlotProps)
else
    clim(CLims)
end


% set(gca, 'Colormap', Colormap)
colormap(Colormap)

