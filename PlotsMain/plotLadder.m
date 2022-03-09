function plotLadder(Data, XLabels, YLabels, Colors, Legend, LegendPosition, PlotProps)
% function for plotting change in values
% Data is Ch x S

Dims = size(Data);

X = 1:Dims(2);

% make legend items only the first of each color
UniqueColors = unique(Colors, 'rows');
LegendOrder = [];

set(gca, 'FontName', PlotProps.Text.FontName, 'FontSize', PlotProps.Text.AxisSize)

hold on
for Indx = 1:Dims(1)
    C = Colors(Indx, :);
    
    UC = ismember(UniqueColors, C, 'rows');
    
    if any(UC) && isempty(YLabels{Indx})
        LegendOrder = [LegendOrder, find(UC)];
        UniqueColors(UC, :) = [2 2 2];
    end
    
    if ~isempty(YLabels{Indx})
        Alpha = 1;
    else
        Alpha = .25;
    end
    
    plot(X, Data(Indx, :), '-', 'LineWidth', PlotProps.Line.Width, ...
        'Color', [C, Alpha], 'HandleVisibility', 'off', 'LineJoin', 'round')
    scatter(X, Data(Indx, :), PlotProps.Scatter.Size, 'HandleVisibility', 'off', ...
        'MarkerFaceColor', C, 'MarkerFaceAlpha', Alpha, 'MarkerEdgeCOlor', 'none')
end

if ~isempty(YLabels)
    text(ones(Dims(1), 1)*.95, Data(:, 1), string(YLabels),  'HorizontalAlignment', 'right',...
        'FontName', PlotProps.Text.FontName, 'FontSize', PlotProps.Text.LegendSize)
end

axis tight
YLims = ylim;

Y = YLims(2)+diff(YLims)*.05;
text(X(1, :), Y*ones(1, Dims(2)), XLabels, 'HorizontalAlignment', 'center', ...
    'FontName', PlotProps.Text.FontName, 'FontSize', PlotProps.Text.TitleSize, 'FontWeight', 'bold')

xlim([.5 2.25])
ylim([YLims(1),  YLims(2)+diff(YLims)*.1])
axis off


if ~isempty(Legend)
    
    for Indx_C = 1:numel(Legend)
        UniqueColors = unique(Colors, 'rows');
        C = UniqueColors(Indx_C, :);
        plot([0 0], [0 .1], '-', 'LineWidth', PlotProps.Line.Width, ...
            'Color', C, 'HandleVisibility', 'on', 'LineJoin', 'round')
    end
    
    legend(Legend(LegendOrder), 'location', LegendPosition)
end



