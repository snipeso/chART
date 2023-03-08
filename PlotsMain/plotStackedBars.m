function plotStackedBars(Data, XLabels, YLim, Legend, Colors, PlotProps)
% Data is a X x L matrix, with each row indicating a new bar, and L a color
% brick.

B = bar(Data, 'stacked');

if ~isempty(XLabels)
    xticklabels(XLabels)
end

if ~isempty(Legend)
    legend(Legend)
    set(legend, 'ItemTokenSize', [7 7], 'location', 'northeast')
end

for Indx_B =1:numel(B)
    B(Indx_B).EdgeColor = 'none';
    B(Indx_B).FaceColor = Colors(Indx_B, :);
end
box off


if ~isempty(YLim)
    ylim(YLim)
end

setAxisProperties(PlotProps)