function stacked_bars(Data, XLabels, YLim, Legend, PlotProps, Colors)
arguments
    Data
    XLabels = [];
    YLim = [];
    Legend = {};
    PlotProps = chART.load_plot_properties();
    Colors = chART.color_picker(size(Data, 2));
end
% Data is a X x L matrix, with each row indicating a new bar, and L a color
% brick.

Bars = bar(Data, 'stacked');

if ~isempty(XLabels)
    xticklabels(XLabels)
end

if ~isempty(Legend)
    legend(Legend)
    set(legend, 'ItemTokenSize', [7 7], 'location', 'northeast')
end

for idxBar = 1:numel(Bars)
    Bars(idxBar).EdgeColor = 'none';
    Bars(idxBar).FaceColor = Colors(idxBar, :);
end
box off

if ~isempty(YLim)
    ylim(YLim)
end

chART.set_axis_properties(PlotProps)