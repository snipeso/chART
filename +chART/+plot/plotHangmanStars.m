function plotHangmanStars(Stats, XPoints, YLims, Colors, PlotProps)
% function that plots all the pairwise comparisons in Stats.p, with a
% single line for each effect. Sorted from bottom to top by total number of
% significant comparisons.
% Stats is a struct that needs to contain either "p" or "p_fdr" as a N x N
% matrix.
% XPoints is an array of N values on the x axis.
% YLims is an optional setting so that the stars start after a certain
% height (the second value of YLims).
% Colors is optional, and will color the lines according to whichever is
% the main group for that line.

% PlotProps needs to contain:
% - Text.LegendSize
% - Color.SigStar

% Parameters
LineWidth = PlotProps.Line.Width/2;
PostMarkerSize = LineWidth;

OldYLims = ylim;
OldXLims =  xlim;

if isfield(Stats, 'p_fdr')
    pValues = Stats.p_fdr;
elseif isfield(Stats, 'p')
    pValues = Stats.p;
else
    error('No p values in Stats')
end

nGroups = size(Stats.p, 1);

% adjust y limits, so that the size of the bars adjusts acordingly
if isempty(YLims)
    axis(gca, 'tight')
else
    ylim(YLims)
end
DataRange = get(gca, 'YLim');

YHeight = DataRange(2);
if isfield(PlotProps, 'SigStar')
Increase = diff(DataRange)*PlotProps.SigStar.Shift;
else
Increase = diff(DataRange)*.05;
end
YHeight = YHeight+Increase/2;

% mirror p-values
pValues(logical(tril(ones(size(pValues)), -1))) = 0;
pValues_mirror = pValues + tril(pValues');

%%% Plot
% This works by finding, for each loop, the row that has the highest number
% of significant comparisons (and the most significant), plotting one bar
% to reflect all the comparisons, a main mast pointing at the corresponding
% condition, and all the minor ticks corresponding to the signigicant +
% trending comparisons. This could also be colored. Then, once plotted,
% this row is set to NaN, so that these comparisons don't get plotted
% again.

hold on
while any(pValues_mirror(:) < .1 & ~isnan(pValues_mirror(:))) % loop until all pairs plotted
    
    % identify next biggest group
    TotSig = sum(~isnan(pValues_mirror)); % total number of significant comparisons
    SumP = sum(pValues_mirror<PlotProps.Stats.Trend) + 1-mean(pValues_mirror, 'omitnan'); % sum of p-values, to add a little weight in case of ties
    MostSig = TotSig + SumP;
    
    [~, Indx] = max(MostSig);
    
    % identify other groups that are significantly different
    X_Indx = ~isnan(pValues_mirror(Indx, :)) & pValues_mirror(Indx, :) < PlotProps.Stats.Trend;
    Ps = pValues_mirror(X_Indx, :);
    X_Minor = XPoints(X_Indx);
    
    if isempty(X_Minor)
            pValues_mirror(Indx, :) = nan;
    pValues_mirror(:, Indx) = nan;
        continue
    end
    
    X_All = [X_Minor, XPoints(Indx)]; % needed for ticks
    X_All = [min(X_All), max(X_All)];
    
    % identify color of line
    if size(Colors, 1) == nGroups
        C = Colors(Indx, :);
    elseif ~isempty(Colors)
        C = Colors;
    else
        C = PlotProps.Color.SigStar;
    end
    
    % identify height at which to draw the line
    YHeight = YHeight+Increase;
    
    % plot main horizontal bar
    plot(X_All, YHeight*ones(size(X_All)),  '-o',  'MarkerFaceColor', C, 'Marker', '.', 'MarkerSize', PostMarkerSize, 'LineWidth', LineWidth, 'Color', C)
    
    % plot main post
    plot([XPoints(Indx), XPoints(Indx)], [YHeight-Increase*.75, YHeight], ...
        '-o',  'MarkerFaceColor', C, 'MarkerSize', PostMarkerSize, 'Marker', '.', 'LineWidth', LineWidth, 'Color', C)
    
    % plot minor posts
    for Indx_x = 1:numel(X_Minor)
        plot(X_Minor([Indx_x, Indx_x]), [YHeight-Increase*.2, YHeight], ...
            '-o',  'MarkerFaceColor', C, 'MarkerSize', PostMarkerSize, 'Marker', '.',  'LineWidth', LineWidth, 'Color', C)
        
        % plot stars
        P = Ps(Indx_x, Indx);
        Symbol = chART.utils.significance_symbol(P);
        if ~isempty(Symbol)
            text(X_Minor(Indx_x), YHeight-Increase*.7, Symbol, 'HorizontalAlignment', 'center', ...
                'Color', C, 'FontSize', PlotProps.Text.LegendSize, 'FontName', PlotProps.Text.FontName)
        end
    end
    
    % remove from list the p-values already plotted
    pValues_mirror(Indx, :) = nan;
    pValues_mirror(:, Indx) = nan;
end

if YHeight+Increase/4 > OldYLims(2)
    ylim([OldYLims(1), YHeight+Increase/4])
else
    ylim(OldYLims)
end

xlim(OldXLims)