function plotConfettiSpaghetti(Data, Stats, XLabels, Colors, PlotProps)
% plotConfettiSpaghetti(Data, Stats, XLabels, Colors, PlotProps)
%
% Plots Data (a P x N matrix) such that each P gets its own Color line, and
% then the average is plotted on top. If Stats struct is provided, which needs to
% include p-values, it will also plot the little stars on top.
% Colors is a P x 3 matrix. If unique colors = P: plots one color per
% person, and then the group average. If unique colors = 1: plots
% everything in one color, but participants with transparency, and mean
% solid. If Colors = [], then the function assigns rainbow colors to
% everyone. If unique colors < P, these are used to group the participants,
% and plots averages acordingly.
%
% PlotProps used:
% - Line.LW
% - Line.Alpha
% - Scatter.Size
% - Text.FontName
% - Text.FontSize

Dims = size(Data);
XPoints = 1:Dims(2);

% assign rainbow colors if none are provided
if isempty(Colors)
    Colors = reduxColormap(PlotProps.Color.Maps.Rainbow, Dims(1));
end


%%% plot each participant
hold on
for Indx_P = 1:Dims(1)
    Color = Colors(Indx_P, :);
    plot(XPoints, Data(Indx_P, :), 'LineWidth', PlotProps.Line.Width, ...
        'Color', [Color, PlotProps.Line.Alpha], 'HandleVisibility', 'off')

    scatter(XPoints, Data(Indx_P, :), PlotProps.Scatter.Size, ...
        'MarkerFaceColor', Color, 'MarkerFaceAlpha',  PlotProps.Line.Alpha, ...
        'MarkerEdgeColor', 'none', 'HandleVisibility', 'off')
end


%%% plot group means
[ColorGroups, ~, Groups] = unique(Colors, 'rows');
TotGroups = size(ColorGroups, 1);

% get means
if TotGroups == Dims(1) % if there's one color per participant, so no special groups
    
    MEANS = nanmean(Data, 1);
    ColorGroups = [0 0 0];

elseif  TotGroups == 1 % if there's one color for all values
    
     MEANS = nanmean(Data, 1);
    
else
    % plot a separate mean for each color group
    MEANS = nan(TotGroups, Dims(2));
    
    for Indx_G = 1:TotGroups
       MEANS(Indx_G, :) = nanmean(Data(Groups==Indx_G, :));
    end
end

% plot means
for Indx_G = 1:size(MEANS, 1)
    plot(XPoints, MEANS(Indx_G, :), 'LineWidth', PlotProps.Line.Width, ...
        'Color', ColorGroups(Indx_G, :), 'HandleVisibility', 'off')
    scatter(XPoints, MEANS(Indx_G, :), PlotProps.Scatter.Size, ColorGroups(Indx_G, :), ...
        'filled', 'MarkerEdgeColor',  ColorGroups(Indx_G, :), 'HandleVisibility', 'off')
end

% plot significance stars on top
if ~isempty(Stats)
    plotHangmanStars(Stats, XPoints, [], ColorGroups, PlotProps)
end


% set x axis
xlim([.5, Dims(2)+.5])
xticks(1:Dims(2))
if ~isempty(XLabels)
    xticklabels(XLabels)
end

set(gca, 'FontName', PlotProps.Text.FontName, 'FontSize', PlotProps.Text.AxisSize)