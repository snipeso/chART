function topo_corner_text(Text, PlotProps)
arguments
    Text
    PlotProps = chART.load_plot_properties();
end

text(.4, .5, Text, 'FontName', PlotProps.Text.FontName, 'FontSize', PlotProps.Text.LegendSize)
