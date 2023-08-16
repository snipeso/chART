function plotEpoch(Data, t, HighlightChannels, HighlightColors, YLabels, Events, YGap, PlotProps)
%
%
% Plots all channels of Data (Ch x T) matrix.
% HighlightChannels is a H x 1 list of indexes of which channels to
% highlight with a color.
% Highlights is a H x 3 matrix of colors for each channel. If H = 1, then
% the same color is applied to all highlights.
% YLabels is a Ch x 1 cell array. Any cell that has a string in it will
% then correspond to a label, and that channel will be plotted in black not
% gray.
% Events is a cell array E x 2, with the first column indicating
% timepoints, the second the labels. There could be a third column with
% colors.


DimsD = size(Data);
DimsE = size(Events);

% spread channels along Y axis
if isempty(YGap)
    YGap = 4.5*nanmean(std(Data, 0, 2));
end

Y = YGap*DimsD(1):-YGap:0;
Y(end) = [];
Min = 0-YGap/2;
Max = Y(1)+YGap/2;

if numel(HighlightChannels) ~= size(HighlightColors, 1)
   HighlightColors = repmat(HighlightColors, numel(HighlightChannels), 1); 
end


%%% Plot
hold on

% plot vertical events
if ~isempty(Events)
    for Indx_E = 1:DimsE(1)
        x = Events{Indx_E, 2};
        Label = Events{Indx_E, 1};
        
        if DimsE(2) == 3
            Color = Events{Indx_E, 3};
            LW = PlotProps.Line.Width;
            HV = 'on';
        else % background, generic color
            Color = PlotProps.Color.Generic;
            LW = .5;
            HV = 'off';
        end
        
        plot([x x], [Min Max], 'Color', Color, 'LineWidth', LW, 'HandleVisibility', HV)
        text(x, Max+YGap*1.5, Label, 'HorizontalAlignment', 'center', ...
            'Color', Color, 'FontName', PlotProps.Text.FontName, ...
            'FontSize', PlotProps.Text.LegendSize)
    end
end


% plot channels
for Indx_Ch = 1:DimsD(1)
    isHighlight = ismember(HighlightChannels, Indx_Ch);
    if any(isHighlight)
        Color = HighlightColors(isHighlight, :);
        LW = 2;
    elseif  ~isempty(YLabels) && ~isempty(YLabels{Indx_Ch})
        Color = [0 0 0];
        LW = .5;
    else
        Color = PlotProps.Color.Generic;
        LW = .5;
    end
    
    plot(t, Data(Indx_Ch, :)+Y(Indx_Ch), 'Color', Color, 'LineWidth', LW)
end

% set up y axis
ylim([Min Max+YGap*2])
if ~isempty(YLabels)
    Ticks = Y;
    RM = cellfun(@isempty, YLabels);
    Ticks(RM) = [];
    YLabels(RM) = [];
    
    yticks(sort(Ticks))
    yticklabels(flip(YLabels))
else
    set(gca,'ytick',[])
end

xlim([t(1), t(end)])

set(gca, 'FontName', PlotProps.Text.FontName, 'FontSize', PlotProps.Text.AxisSize)