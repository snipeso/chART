function overlapping_histograms(Data,  xTickLabels, xLabel, yLabel, Legend, PlotProps, Colors, Alpha)
arguments
    Data
    xTickLabels = 1:size(Data, 1);
    xLabel = '';
    yLabel = '';
    Legend = {};
    PlotProps =  chART.load_plot_properties();
    Colors = chART.color_picker([size(Data, 2)]);
    Alpha = .3;
end
% Plots overlapping "histograms" or bar plots.
% Data: a N x L matrix, with each N reflecting a value for a specific bar,
% and L the number of sets of histograms (one color per L).
% xTickLabel is optional, if it's not just the numbers 1-N.
% Colors should be L x 3, recommended that they get progressively darker.
% Legend is 1 x L cell labelling each color

Dims = size(Data);

hold on
for Indx_L = 1:Dims(2)
    bar(xTickLabels, Data(:, Indx_L), 'FaceColor', Colors(Indx_L, :), ...
        'FaceAlpha', Alpha, 'EdgeColor','none')
end

chART.set_axis_properties(PlotProps)
xlabel(xLabel)
ylabel(yLabel)

if ~isempty(Legend)
    legend(Legend)
    set(legend, 'ItemTokenSize', [15 15])
end