function PlotProps = getProperties(PropertyTypes)
% Load in the specific formatting for your plots.
% PropertyType should be a cell array of strings, corresponding to the script name in the
% Properties folder. If nothing matches, this function will assign default
% values. Any property not specified in the chosen format will be assigned
% the defaults. Scripts are called in order, so choose first a general
% configuration, then all the sub-changes


if exist('Template', 'file')
    run('Template')
else
    addchARTpaths()
    error('Could not find template property file. Try again. Maybe this time it will work.')
end

% Run selected, so it overwrites whatever it has
for Indx_T = 1:numel(PropertyTypes)
    run(PropertyTypes{Indx_T})
end


% Save to structure
PlotProps = struct();
PlotProps.Figure = Figure;
PlotProps.Axes = Axes;
PlotProps.Line = Line;
PlotProps.Scatter = Scatter;
PlotProps.Patch = Patch;
PlotProps.Text = Text;
PlotProps.Color = Color;
PlotProps.Colorbar = Colorbar;
PlotProps.Indexes = Indexes;
PlotProps.Stats = Stats;
PlotProps.External = External;

