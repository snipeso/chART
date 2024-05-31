function save_figure(Title, Destination, PlotProps)
arguments
    Title
    Destination = cd;
    PlotProps = chART.load_plot_properties();
end
% little script for saving figures, so I can change things all together if
% I want


% set(gcf, 'Color', 'none');
set(gcf, 'InvertHardcopy', 'off', 'Color', PlotProps.Color.Background)

saveas(gcf, fullfile(Destination, [Title, '.svg']));
print(fullfile(Destination, Title), '-dtiff', '-r1000')