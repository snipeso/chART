function plotUFO(Data, CI, XLabels, CLabels, Colors, Orientation, PlotProps)
% Data is a m x n matrix, CI is an m x n x 2. Colors is m x 3 or n x 3.
% this plots means and confidence intervals stacked vertically.

Dims = size(Data);

LW = PlotProps.Line.Width*2;
ScatterSize = PlotProps.Scatter.Size*4;

XMajorPoints = flip(1:Dims(1))';

XScatter = linspace(-.5, .5, Dims(2)+2);
XScatter([1, end]) = [];

XMinorPoints = XMajorPoints + XScatter;

if Dims(2) > 3
    Paleness = linspace(.2, 1, Dims(2));
elseif Dims(2) > 1
    Paleness = linspace(.3, 1, Dims(2));
else
    Paleness = 1;
end

hold on

% plot 0 
plot([0 Dims(1)+1], [0 0], 'k', 'LineWidth', 2, 'HandleVisibility', 'off')

for Indx_N = 1:Dims(2)
    
    % determine if colors provided come from m or n dimention, and choose
    % appropriately
    if size(Colors, 1) == Dims(1)
        Color = makePale(Colors, Paleness(Indx_N)); % make it paler for each n
        GenericColor =  makePale(PlotProps.Color.Generic, Paleness(Indx_N)); % make it paler for each n
    elseif size(Colors, 1) == Dims(2)
        Color = repmat(Colors(Indx_N, :), Dims(1), 1);
    end
    
    
    for Indx_M = 1:Dims(1)
        if Dims(2)>1 % if there's two values per x tick
            X = XMinorPoints(Indx_M, Indx_N);
            
            % HACK to plot gray and pale gray legend
            if Indx_M == 1
                plot([X, X], squeeze(CI(Indx_M, Indx_N, :)), ...
                    'Color', GenericColor(Indx_M, :), 'LineWidth', LW, ...
                    'HandleVisibility', 'on')
            end
            
            plot([X, X], squeeze(CI(Indx_M, Indx_N, :)), 'Color', Color(Indx_M, :), ...
                'LineWidth', LW, 'HandleVisibility', 'off')
        else
            X = XMajorPoints(Indx_M);
            plot([X, X], squeeze(CI(Indx_M, :)), 'Color', Color(Indx_M, :), ...
                'LineWidth', LW, 'HandleVisibility', 'off')
        end
    end
    
    scatter( XMinorPoints(:, Indx_N), Data(:, Indx_N), ScatterSize, Color, ...
        'filled', 'HandleVisibility', 'off')
end


set(gca, 'FontName', PlotProps.Text.FontName, 'FontSize', PlotProps.Text.AxisSize)

xlim([.7 Dims(1)+.3])
xticks(flip(XMajorPoints))
xticklabels(flip(XLabels))


ylim([min(CI(:)),  max(CI(:))])
padAxis('x')
padAxis('y')

if ~isempty(CLabels)
    legend(CLabels, 'Location', 'northwest')
end

if strcmpi(Orientation, 'vertical')
    view([90 90])
end
set(gca, 'ygrid', 'on')
