function plotSpikeBalls(Data, XTickLabels, Legend, Colors, ErrorType, PlotProps)
% Data is a P x M x N matrix. Legend and colors are N.
% Error type can be: 'SD' standard deviation, 'IQ' interquartile range

Dims = size(Data);

X = 1:Dims(2);

if ~isempty(XTickLabels)
    xtick(X)
    XTickLabels(XTickLabels)
end


hold on
for Indx_N = 1:Dims(3)
    D = squeeze(mean(Data(:, :, Indx_N), 1, 'omitnan'));

    switch ErrorType
        case 'IQ'

            CI = quantile(squeeze(Data(:, :, Indx_N)), [.2 .75]);
            pos = CI(2, :) - D;
            neg = D - CI(1, :);

            errorbar(X, D, neg, pos,...
                'o-', 'Color', Colors(Indx_N, :), 'markerfacecolor', Colors(Indx_N, :), ...
                'LineWidth', PlotProps.Line.Width, 'HandleVisibility', 'on');

        case 'SD'
            err = std(squeeze(Data(:, :, Indx_N)), 'omitnan');
            errorbar(X, D, err, 'o-', 'Color', Colors(Indx_N, :), 'markerfacecolor', Colors(Indx_N, :),...
                'LineWidth', PlotProps.Line.Width, 'HandleVisibility', 'on');

        otherwise
            plot(X, D, 'o-', 'Color', Colors(Indx_N, :), 'markerfacecolor', Colors(Indx_N, :),...
                'LineWidth', PlotProps.Line.Width, 'HandleVisibility', 'on');
    end
end


setAxisProperties(PlotProps)

if ~isempty(Legend)
    legend(Legend)
    %     set(legend, 'ItemTokenSize', [20 20], 'location', 'northeast')
end

xlim([0.5, Dims(2)+.5])