function h = pretty_colorbar(Colormap, CLims, CLabel, PlotProps)
arguments
    Colormap = 'Linear';
    CLims = [0 1];
    CLabel = '';
    PlotProps = chART.load_plot_properties();
end
% makes the colorbar exactly how I want it. A hack on top of a hack.

if isempty(CLims)
    CLims = clim;
end

% select ticks
nTicks = PlotProps.Colorbar.Ticks;


  Spacing = diff(CLims)/4;
if Spacing > 10
    F = .1;
elseif Spacing > 1
    F = 1;
elseif Spacing > .1
    F = 10;
else
    F = 100;
end

clim(CLims)
A = colorbar;
Ticks = A.Ticks;
colorbar off

if numel(Ticks)==5
    Ticks = Ticks([1, 3, 5]);
elseif numel(Ticks)==6
        Ticks(end+1) = Ticks(end)+Ticks(2)-Ticks(1);
      Ticks = Ticks([1, 3, 5, 7]);
      CLims(end) = Ticks(end);
      clim(CLims)
elseif  numel(Ticks)==7
       Ticks = Ticks([1, 3, 5, 7]);
end

h = colorbar('location', PlotProps.Colorbar.Location, 'Color', 'w', ...
    'LineWidth', 2, 'Ticks', Ticks);

if ~isempty(CLabel)
    ylabel(h, CLabel, 'FontName', PlotProps.Text.FontName, ...
        'FontSize', PlotProps.Text.AxisSize,'Color', 'k')
end

set(gca, 'FontName', PlotProps.Text.FontName, 'FontSize', PlotProps.Text.AxisSize)

for ii=1:numel(h.XTickLabel)
    h.XTickLabel{ii}=['\color[rgb]{0,0,0} ', h.XTickLabel{ii}];
end

h.TickLength = 0;
colormap(chART.utils.resize_colormap(PlotProps.Color.Maps.(Colormap), ...
    PlotProps.Color.Steps.(Colormap)))

end


% axis off