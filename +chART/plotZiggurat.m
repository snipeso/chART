function plotZiggurat(Data, xLabel, xTickLabels, yLabel, Colors, Legend, PlotProps)
% Plots overlapping "histograms" or bar plots.
% Data: a N x L matrix, with each N reflecting a value for a specific bar,
% and L the number of sets of histograms (one color per L).
% xTickLabel is optional, if it's not just the numbers 1-N. 
% Colors should be L x 3, recommended that they get progressively darker.
% Legend is 1 x L cell labelling each color

Dims = size(Data);


if isempty(Colors)
    Colors = chART.utils.color_picker([1, Dims(2)]);
end

if isempty(xTickLabels)
    xTickLabels = 1:Dims(1);
end

hold on
for Indx_L = 1:Dims(2)
    bar(xTickLabels, Data(:, Indx_L), 'FaceColor', Colors(Indx_L, :), ...
        'FaceAlpha', PlotProps.Patch.Alpha, 'EdgeColor','none')
end


setAxisProperties(PlotProps)

 if ~isempty(xLabel)
     xlabel(xLabel)
 end

%  if ~isempty(xTickLabels)
%      xticks(1:Dims(1))
%      xticklabels(xTickLabels)
%  end

 if ~isempty(yLabel)
     ylabel(yLabel)
 end

 if ~isempty(Legend)
     legend(Legend)
 end