function plotColorbar(Colormap, CLims, CLabel,  PlotProps)
h = colorbar('location', PlotProps.Colorbar.Location);
ylabel(h, CLabel, 'FontName', PlotProps.Text.FontName, 'FontSize', PlotProps.Text.LegendSize)
h.TickLength = 0;
caxis(CLims)
axis off
colormap(reduxColormap(PlotProps.Color.Maps.(Colormap), PlotProps.Color.Steps.(Colormap)))
set(gca, 'FontName', PlotProps.Text.FontName, 'FontSize', PlotProps.Text.LegendSize)