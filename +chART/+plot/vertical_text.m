function vertical_text(Text, ShiftX, ShiftY, PlotProps)
arguments
    Text
    ShiftX = .15;
    ShiftY = .5;
    PlotProps = chART.load_plot_properties();
end
% used especially for y labels of grid plots like topoplots

X = get(gca, 'XLim');
Y = get(gca, 'YLim');
text(X(1)-diff(X)*ShiftX, Y(1)+diff(Y)*ShiftY, Text, ...
    'FontSize', PlotProps.Text.TitleSize, 'FontName', PlotProps.Text.FontName, ...
    'FontWeight', 'Bold', 'HorizontalAlignment', 'Center', 'Rotation', 90);