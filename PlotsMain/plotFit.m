function plotFit(f, x, y, xLabel, yLabel, Color, PlotProps)
% plots a fitted line nicely

Plt = plot(f, x, y);
legend off

% change colors and shapes of scattered dots
Plt(1).Color = 'k';
Plt(1).MarkerSize = PlotProps.Line.MarkerSize;

% change properties of fitted line
if ~isempty(Color)
    Plt(2).Color = Color;
else
    Plt(2).Color = getColors(1);
end

Plt(2).LineWidth = PlotProps.Line.Width;

if ~isempty(xLabel)
    xlabel(xLabel)
end

if ~isempty(yLabel)
    ylabel(yLabel)
end


set(gca, 'FontName', PlotProps.Text.FontName, 'FontSize', PlotProps.Text.AxisSize, 'Box', 'off')