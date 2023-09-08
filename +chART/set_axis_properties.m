function set_axis_properties(PlotProps)

 set(gca, 'FontName', PlotProps.Text.FontName, ...
     'FontSize', PlotProps.Text.AxisSize, ...
     'Color', PlotProps.Color.Background)

 title('', 'FontSize',PlotProps.Text.TitleSize)