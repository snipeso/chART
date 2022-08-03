function plotScatterBox(Data, Stats, XLabels, Colors, YLims, PlotProps)
% Data is a P x m matrix. This plots a cluster of boxplots for each m, with
% the partcipant dots on top.

set(gca, 'Units', 'pixels') % don't know why, but figure acts weird without this

Dims = size(Data);

if size(Colors, 1) == Dims(1)
    ScatterColor = Colors;
    BoxColor = 'k';
elseif size(Colors, 1) == Dims(2)
    ScatterColor = [.5 .5 .5];
    BoxColor = Colors;
else
    ScatterColor = 'k';
    BoxColor = 'k';
end


%%% plot boxplots
hold on
boxplot(Data, 'BoxStyle', 'outline', 'Colors', BoxColor, 'Symbol', '')

%%% plot scatter of participants
for Indx_T = 1:Dims(2)
    scatter(ones(Dims(1), 1)*Indx_T, Data(:, Indx_T), PlotProps.Scatter.Size, ScatterColor, 'filled',...
        'MarkerFaceAlpha', PlotProps.Line.Alpha)
end

if ~isempty(YLims)
    ylim(YLims)
end

set(findobj(gca,'LineStyle','--'),'LineStyle','-') % make whiskers solid line
set(findobj(gca,'LineStyle','-'),'LineWidth',PlotProps.Line.Width) % make all lines quite thick
set(findobj(gca,'Marker','none'),'Marker','.')
set(findobj(gca,'Tag','Outliers'),'Marker','none')

%%% plot pairwise significances
plotHangmanStars(Stats, 1:Dims(2), YLims, BoxColor, PlotProps)

h=gca; h.YAxis.TickLength = [0 0];
xticklabels(XLabels)
set(gca, 'FontName', PlotProps.Text.FontName, 'FontSize', PlotProps.Text.AxisSize, ...
    'Units', 'normalized',  'YTickLabel', [], 'YGrid', 'on')

xlim([.5 Dims(2)+.5])
box off

