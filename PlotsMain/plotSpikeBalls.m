function plotSpikeBalls(Data, XTickLabels, Legend, Colors, PlotProps)
% Data is a P x M x N matrix. Legend and colors are N.

Dims = size(Data);

X = 1:Dims(2);

if ~isempty(XTickLabels)
    xtick(X)
    XTickLabels(XTickLabels)
end


hold on
for Indx_N = 1:Dims(3)
    D = squeeze(mean(Data(:, :, Indx_N), 1, 'omitnan'));
    err = std(squeeze(Data(:, :, Indx_N)), 'omitnan');
    
    errorbar(X, D, err, 'o-', 'Color', Colors(Indx_N, :), 'markerfacecolor', Colors(Indx_N, :),...
        'LineWidth', PlotProps.Line.Width, 'HandleVisibility', 'on');
end


setAxisProperties(PlotProps)

if ~isempty(Legend)
    legend(Legend)
%     set(legend, 'ItemTokenSize', [20 20], 'location', 'northeast')
end

xlim([0.5, Dims(2)+.5])