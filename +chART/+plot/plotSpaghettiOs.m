function plotSpaghettiOs(Data, Stats, Indx_BL, xLabels, Legend, Colors, PlotProps)
% plotSpaghettiOs(Data, Stats, Indx_BL, xLabels, Legend, Colors, PlotProps)
%
% Pretty ugly script at the moment...
% Plots Data (P x M x N) such that each N gets its own Color line, and a
% circle marks whether the change across Ms is significant.
% Colors is N x 3. There are defaults if Colors is empty.
% Legend is optional, but should be N strings


Dims = size(Data);


% adjust p_fdr array, since its missing the baseline
p_fdr = nan(Dims(2), Dims(3));
p_fdr(~ismember(1:Dims(2), Indx_BL), :) = Stats.p_fdr;

%%% prepare label information

% if labels for the N axis provided, include them in legend
if isempty(Legend)
    HV = 'off';
else
    HV = 'on';
end

if isempty(Colors)
   Colors = chART.color_picker(Dims(3)); 
end

% terms for significant dots
Alpha = num2str(PlotProps.Stats.Alpha);
Alpha = ['p<', Alpha(2:end)];

TrendAlpha =  num2str(PlotProps.Stats.Trend);
Trend = ['p<', TrendAlpha(2:end)];



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Plot everything

Marked = [false false]; % used to keep track of handles for legend; first item is Trend, second is Sig

% plot mean lines first (stupid hack to get the order of the legend right)
hold on
for Indx_N = 1:Dims(3)
    C = Colors(Indx_N, :);
    
    MEAN = squeeze(mean(Data(:, :, Indx_N), 1, 'omitnan'));
    plot(MEAN, 'Color', C,  'LineWidth', PlotProps.Line.Width, 'HandleVisibility', HV);
end

% plot significance marker if present
for Indx_N = 1:Dims(3) % loop through lines
    
    C = Colors(Indx_N, :);
    MEAN = squeeze(mean(Data(:, :, Indx_N), 1, 'omitnan'));
    plot(MEAN, 'Color', C,  'LineWidth', PlotProps.Line.Width, 'HandleVisibility', 'off');
    for Indx_S = 1:Dims(2) % loop through points in line
        
        if Indx_S == Indx_BL % don't plot marker for reference session
            continue
        end
        
        P = p_fdr(Indx_S, Indx_N);
        
        % HACK plot hidden marker behind marker to include in legend
        if P <= PlotProps.Stats.Alpha % big empty circle for significant difference
            MF = [1 1 1]; % Marker gace
            ME = C; % Marker edge color
            
            if ~Marked(2) % if not already placed a hidden marker, do so
                plot(Indx_S, MEAN(Indx_S), 'o', 'MarkerSize', PlotProps.Line.MarkerSize,...
                    'MarkerEdgeColor', PlotProps.Color.Generic, 'MarkerFaceColor', MF,  ...
                    'LineWidth',  PlotProps.Line.Width, 'HandleVisibility', 'on');
                
                Legend = [Legend, Alpha]; % add legend item
                Marked(2) = true;
            end
            
        elseif P <= PlotProps.Stats.Trend % filled little circle for trend
            MF = C;
            ME = 'none';
            
            if ~Marked(1)
                plot(Indx_S, MEAN(Indx_S), 'o', 'MarkerSize', PlotProps.Line.MarkerSize,...
                    'MarkerEdgeColor', ME, 'MarkerFaceColor', PlotProps.Color.Generic,  ...
                    'LineWidth',  PlotProps.Line.Width, ...
                    'HandleVisibility', 'on');
                Legend = [Legend, Trend];
                Marked(1) = true;
            end
            
        else
            MF = 'none';
            ME = 'none';
        end
        
        plot(Indx_S, MEAN(Indx_S), 'o', 'MarkerSize', PlotProps.Line.MarkerSize,...
            'MarkerEdgeColor', ME, 'MarkerFaceColor', MF,  'LineWidth', PlotProps.Line.Width, ...
            'HandleVisibility', 'off');
    end
end

set(gca, 'YGrid', 'on')
chART.set_axis_properties(PlotProps)

xlim([.75, Dims(2)+.25])
xticks(1:Dims(2))
xticklabels(xLabels)
h=gca; h.YAxis.TickLength = [0 0];


%%% legend
legend(Legend, 'Location','northwest')
if ~any(Marked) % removes empty box
    legend off
end

