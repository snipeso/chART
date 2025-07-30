function colorscale_grid(Grid, xLabels, yLabels, PlotProps)


[nRows, nCols] = size(Grid);


imagesc(Grid)
chART.set_axis_properties(PlotProps)

colormap(flip(PlotProps.Color.Maps.Divergent))

clim([-max(abs(Grid(:))), max(abs(Grid(:)))]*2)

xticks(1:nCols)
xticklabels(xLabels)

yticks(1:nRows)
yticklabels(yLabels)

ax = gca;            % Get current axes
ax.TickLength = [0 0]; 
ax.XAxisLocation = 'top'; 
ax.FontWeight = 'bold';  

for row = 1:nRows
    for col = 1:nCols
        value = Grid(row, col);
        text(col, row, num2str(value), ...   % Format to 2 decimals
            'HorizontalAlignment', 'center', ...
            'VerticalAlignment', 'middle', ...
            'Color', 'k', ...       % Change to 'w' if colormap is dark
            'FontSize', PlotProps.Text.AxisSize);
    end
end
