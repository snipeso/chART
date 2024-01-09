function vertical_colorbar(CLabel, PlotProps)

h = colorbar;
h.TickLength = 0;
ylabel(h, CLabel, 'FontName', PlotProps.Text.FontName, 'FontSize', PlotProps.Text.LegendSize) % text style needs to be specified for label, because its weird
