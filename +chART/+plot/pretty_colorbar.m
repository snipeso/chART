% function h = pretty_colorbar(Colormap, CLims, CLabel, PlotProps)
% arguments
%     Colormap = 'Linear'; % could also be the actual colormap
%     CLims = [0 1];
%     CLabel = '';
%     PlotProps = chART.load_plot_properties();
% end
% % makes the colorbar exactly how I want it. A hack on top of a hack.
% 
% if isempty(CLims)
%     CLims = clim;
% end
% 
% % select ticks
% nTicks = PlotProps.Colorbar.Ticks;
% 
% 
% Spacing = diff(CLims)/4;
% if Spacing > 10
%     F = .1;
% elseif Spacing > 1
%     F = 1;
% elseif Spacing > .1
%     F = 10;
% else
%     F = 100;
% end
% 
% clim(CLims)
% A = colorbar;
% Ticks = A.Ticks;
% colorbar off
% 
% if numel(Ticks) == 2
%     Ticks = CLims;
% elseif numel(Ticks)==5
%     Ticks = Ticks([1, 3, 5]);
% elseif numel(Ticks)==6
%     Ticks(end+1) = Ticks(end)+Ticks(2)-Ticks(1);
%     Ticks = Ticks([1, 3, 5, 7]);
%     CLims(end) = Ticks(end);
%     clim(CLims)
% elseif  numel(Ticks)==7
%     Ticks = Ticks([1, 3, 5, 7]);
% end
% 
% h = colorbar('location', PlotProps.Colorbar.Location, 'Color', 'w', ...
%     'LineWidth', 2, 'Ticks', Ticks);
% 
% if ~isempty(CLabel)
%     ylabel(h, CLabel, 'FontName', PlotProps.Text.FontName, ...
%         'FontSize', PlotProps.Text.AxisSize,'Color', 'k')
% end
% 
% set(gca, 'FontName', PlotProps.Text.FontName, 'FontSize', PlotProps.Text.AxisSize)
% 
% for ii=1:numel(h.XTickLabel)
%     h.XTickLabel{ii}=['\color[rgb]{0,0,0} ', h.XTickLabel{ii}];
% end
% 
% h.TickLength = 0;
% 
% if ischar(Colormap) || isstring(Colormap)
%     colormap(chART.utils.resize_colormap(PlotProps.Color.Maps.(Colormap), ...
%         PlotProps.Color.Steps.(Colormap)))
% else
%     colormap(Colormap)
% end
% 
% h.Box = 'off';
% end
% 
% 
% % axis off

function pretty_colorbar(Colormap, CLims, CLabel, PlotProps)
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

% have a midpoint or not in the axis
if strcmp(Colormap, 'Divergent')
    Spacing = (CLims(2)-CLims(1))/4;
else
    Spacing = (CLims(2)-CLims(1))/3;
end

% Biggest = diff(CLims);
% 
% if Biggest > 10
%     CLims = round(CLims/10)*10;
% elseif Biggest > 1
%     CLims = round(CLims);
% elseif Biggest > .1
%     CLims = round(CLims, 1);
% else
%     CLims = round(CLims, 2);
%     warning('May be rounding legend too much')
% end

if Spacing > 10
    Spacing = round(Spacing/10)*10;
elseif Spacing > 1
    Spacing = round(Spacing);
     CLims = round(CLims, 1);
elseif Spacing > .1
    Spacing = round(Spacing, 1);
    CLims = round(CLims, 1);
else
    Spacing = round(Spacing, 2);
      CLims = round(CLims, 2);
    warning('May be rounding legend too much')
end


% % round to reasonable decimal
% Biggest = max(abs(CLims));
% if Biggest > 10
%     Spacing = round(Spacing/10)*10;
% elseif Biggest > 1
%     Spacing = round(Spacing);
% 
% elseif Biggest > .1
%     Spacing = round(Spacing, 1);
% else
%     Spacing = round(Spacing, 2);
%     warning('May be rounding legend too much')
% end

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


    % round to reasonable decimal
% Biggest = max(abs(Ticks));
% if Spacing > 10
%     Ticks = round(Ticks/10)*10;
% elseif Spacing > 1
%     Ticks = round(Ticks);
% 
% elseif Spacing > .1
%     Ticks = round(Ticks, 1);
% else
%     Ticks = round(Ticks, 2);
%     warning('May be rounding legend too much')
% end

% % use the least amount of digits
% if max(abs(Ticks))>10
%     Ticks = round(Ticks);
% elseif max(abs(Ticks)) > 1
%     Ticks = round(Ticks, 1);
% elseif max(abs(Ticks)) > .1
%      Ticks = round(Ticks, 2);
% end


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
h.Box = 'off';
% axis off