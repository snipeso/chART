function plotColorbar(Colormap, CLims, CLabel, PlotProps)

h = colorbar('location', PlotProps.Colorbar.Location, 'Color', 'w', 'LineWidth',2);
ylabel(h, CLabel, 'FontName', PlotProps.Text.FontName, 'FontSize', PlotProps.Text.AxisSize,'Color', 'k')
caxis(CLims)
set(gca, 'FontName', PlotProps.Text.FontName, 'FontSize', PlotProps.Text.AxisSize)

for ii=1:numel(h.YTickLabel)
    h.XTickLabel{ii}=['\color[rgb]{0,0,0} ', h.XTickLabel{ii}];
end



h.TickLength = 0;
axis off
colormap(reduxColormap(PlotProps.Color.Maps.(Colormap), PlotProps.Color.Steps.(Colormap)))
