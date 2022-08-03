function plotColorbar(Colormap, CLims, CLabel, PlotProps)

h = colorbar('location', PlotProps.Colorbar.Location, 'Color', 'w', 'LineWidth',2);
ylabel(h, CLabel, 'FontName', PlotProps.Text.FontName, 'FontSize', PlotProps.Text.AxisSize,'Color', 'k')


for ii=1:numel(h.YTickLabel)
    h.XTickLabel{ii}=['\color[rgb]{0,0,0} ',num2str(ii)];
end
for ii=1:10
    h.YTickLabel{ii}=['\color[rgb]{0,0,0} ',num2str(ii)];
end



h.TickLength = 0;
caxis(CLims)
axis off
colormap(reduxColormap(PlotProps.Color.Maps.(Colormap), PlotProps.Color.Steps.(Colormap)))
set(gca, 'FontName', PlotProps.Text.FontName, 'FontSize', PlotProps.Text.AxisSize)