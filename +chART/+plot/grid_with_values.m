function grid_with_values(Data, Labels, CLims, Colormap, PlotProps)
%PLOT_GRID Displays a labeled grid with numeric values in each cell.
arguments
    Data
    Labels = 1:size(Data,1)
    CLims = [];
    Colormap = 'Linear';
    PlotProps = chART.load_plot_properties();
end

imagesc(Data)
chART.set_axis_properties(PlotProps)
colormap(PlotProps.Color.Maps.(Colormap))

% Set tick labels
xticks(1:numel(Labels))
xticklabels(Labels)
yticks(1:numel(Labels))
yticklabels(Labels)

axis square

% Apply color limits if provided
if ~isempty(CLims)
    clim(CLims)
end

% Add text labels inside each cell
for i = 1:size(Data, 1)
    for j = 1:size(Data, 2)
        val = Data(i, j);
        if ~isnan(val)
            % Determine text color based on contrast
            if ~isempty(CLims)
                normVal = (val - CLims(1)) / (CLims(2) - CLims(1));
            else
                dmin = min(Data(:), [], 'omitnan');
                dmax = max(Data(:), [], 'omitnan');
                normVal = (val - dmin) / (dmax - dmin);
            end
            if normVal > 0.5
                txtColor = [0 0 0];  % dark text
            else
                txtColor = [1 1 1];  % light text
            end
            text(j, i, num2str(val, '%.2f'), ...
                'HorizontalAlignment', 'center', ...
                'VerticalAlignment', 'middle', ...
                'Color', txtColor, ...
                'FontSize', PlotProps.Text.AxisSize);
        end
    end
end

ax = gca;
ax.TickLength = [0 0]; 
ax.XAxisLocation = 'top';
