function Stats = plotCorrelations(Data1, Data2, AxisLabels, Legend, Colors, PlotProps)
% Data1 and Data2 are P x G matrices, with G groups labeled with colors.
% AxisLabels is a cell with {'xlabel', 'ylabel'}; Legend is {G x 1}. Colors
% are [G x 3].

Dims = size(Data1);

Stats.r = nan(Dims(2), 1);
Stats.pvalue = Stats.r;

if Dims(2)>1
    if isempty(Colors)
        Colors = getColors(Dims(2));
    end
else
    if isempty(Colors)
        Colors = PlotProps.Color.Generic;
    end
end

Keep = ~(isnan(Data1)|isnan(Data2));

hold on
for Indx_G = 1:Dims(2)

    if size(Colors, 1) == Dims(2)
        C = Colors(Indx_G, :);
    elseif size(Colors, 1) == Dims(1)
        C = Colors;
    else
        C = Colors;
    end
    scatter(Data1(:, Indx_G), Data2(:, Indx_G), ...
        PlotProps.Scatter.Size, C, 'filled', 'MarkerFaceAlpha', .5 )

    % get correlation
    [R, P, C1, C2] = corrcoef(Data1(Keep, Indx_G), Data2(Keep, Indx_G));
    Stats.r(Indx_G) = R(2);
    Stats.pvalue(Indx_G) = P(2);
    Stats.CI = [C1(2), C2(2)];
end

% plot regression lines. For some reason, these are the scattered plots
% backwards.

if size(Colors, 1) == Dims(1)
    Colors = [0 0 0];
end

L = lsline;
FlippedColors = flipud(Colors);
FlippedStats = flipud(Stats.pvalue);
for Indx_L = 1:numel(L)
    if  FlippedStats(Indx_L) <= .05
        L(Indx_L).LineWidth = PlotProps.Line.Width;
    else
        L(Indx_L).LineWidth = 2;
    end
    L(Indx_L).Color = FlippedColors(Indx_L, :);

end

set(gca, 'FontName', PlotProps.Text.FontName, 'FontSize', PlotProps.Text.AxisSize)
axis square
if~isempty(Legend)
    legend(Legend)
end
xlim([min(Data1(:)), max(Data1(:))])
ylim([min(Data2(:)), max(Data2(:))])

if ~isempty(AxisLabels)
    xlabel(AxisLabels{1})
    ylabel(AxisLabels{2})
end