function pretty_colorbar(Colormap, CLims, CLabel, PlotProps)
arguments
    Colormap = 'Linear';
    CLims = [0 1];
    CLabel = '';
    PlotProps = chART.load_plot_properties();
end
% makes the colorbar exactly how I want it. A hack on top of a hack.

% have a midpoint or not in the axis
if strcmp(Colormap, 'Divergent')
    Spacing = (CLims(2)-CLims(1))/4;
else
    Spacing = (CLims(2)-CLims(1))/3;
end

% round to reasonable decimal
Biggest = max(abs(CLims));
if Biggest > 10
    Spacing = round(Spacing);
elseif Biggest > 1
    Spacing = round(Spacing, 1);

elseif Biggest > .1
    Spacing = round(Spacing, 1);
else
    Spacing = round(Spacing, 2);
    warning('May be rounding legend too much')
end

if strcmp(Colormap, 'Divergent')
    Ticks = unique([0:-Spacing:CLims(1), 0:Spacing:CLims(2)]);
    if CLims(2)-max(Ticks) > Spacing/2
        Ticks = [Ticks, CLims(2)];
    end
    if abs(CLims(1))-abs(min(Ticks)) > Spacing/2
        Ticks = [ CLims(1), Ticks];
    end
    Ticks = sort(Ticks);

else
    Ticks = CLims(1):Spacing:CLims(2);
    if CLims(2)-Ticks(end) > Spacing/2
        Ticks(end+1) = CLims(2);
    end
    Ticks = unique(Ticks);
end


h = colorbar('location', PlotProps.Colorbar.Location, 'Color', 'w', ...
    'LineWidth', 2, 'Ticks', Ticks);

if ~isempty(CLabel)
    ylabel(h, CLabel, 'FontName', PlotProps.Text.FontName, ...
        'FontSize', PlotProps.Text.AxisSize,'Color', 'k')
end

clim(CLims)
set(gca, 'FontName', PlotProps.Text.FontName, 'FontSize', PlotProps.Text.AxisSize)

for ii=1:numel(h.XTickLabel)
    h.XTickLabel{ii}=['\color[rgb]{0,0,0} ', h.XTickLabel{ii}];
end

h.TickLength = 0;
colormap(chART.utils.resize_colormap(PlotProps.Color.Maps.(Colormap), ...
    PlotProps.Color.Steps.(Colormap)))
axis off