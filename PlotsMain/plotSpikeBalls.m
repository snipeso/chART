function plotSpikeBalls(Data, XTickLabels, Legend, Colors, ErrorType, PlotProps)
% Data is a P x M x N matrix. Legend and colors are N.
% Error type can be: 'SD' standard deviation, 'IQ' interquartile range

Dims = size(Data);

if numel(Dims)<3
    Dims(3) = 1;
end

X = 1:Dims(2);

if ~isempty(XTickLabels)
    xticks(X)
    xticklabels(XTickLabels)
end

hold on
for Indx_N = 1:Dims(3)
    D = squeeze(mean(Data(:, :, Indx_N), 1, 'omitnan'));

    switch ErrorType
        case 'IQ'

            % get error bar values (relative to midpoint)
            CI = quantile(squeeze(Data(:, :, Indx_N)), [.25 .75]);
            pos = CI(2, :) - D;
            neg = D - CI(1, :);

            % plot
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
    set(legend, 'ItemTokenSize', [20 20], 'location', 'northeast')
end

xlim([0.5, Dims(2)+.5])