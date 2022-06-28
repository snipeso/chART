function plotStars(pValues, XPoints, YLims, Colors, PlotProps)
% plot signifiance stars above specific points

OldYLims = ylim;
OldXLims =  xlim;

if isempty(YLims)
    axis(gca, 'tight')
else
    ylim(YLims)
end
DataRange = get(gca, 'YLim');

Y = DataRange(2)+diff(DataRange)*.05;

if ~isempty(Colors)
    C = Colors;
else
    C = PlotProps.Color.SigStar;
end

for Indx_S = 1:numel(pValues)
    P = pValues(Indx_S);
    Symbol = getSigSymbol(P);
    if strcmp(Symbol, ' ')
        Symbol = '~';
    end
    if ~isempty(Symbol)

        text(XPoints(Indx_S), Y, Symbol, 'HorizontalAlignment', 'center', ...
            'Color', C, 'FontSize', PlotProps.Text.LegendSize, 'FontName', PlotProps.Text.FontName)
    end
end

if Y>OldYLims(2)
    ylim([OldYLims(1), OldYLims(2)+diff(DataRange)*.1])
else
    ylim(OldYLims)
end

xlim(OldXLims)