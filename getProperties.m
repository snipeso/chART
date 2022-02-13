function PlotProps = getProperties(PropertyType)
% Load in the specific formatting for your plots.
% PropertyType should be a string, corresponding to a script name in the
% Properties folder. If nothing matches, this function will assign default
% values. Any property not specified in the chosen format will be assigned
% the defaults.


%%% Axis positioning
Figure.Padding = 10;
Figure.Width = 10;
Figure.Height = 10;
Figure.Units = 'centimeters';

Axes.xPadding = 10;
Axes.yPadding = 10;


%%% Lines
Line.Width = 1;
Line.MarkerSize = 1;
Line.Alpha = .1;

%%% Scatter plot
Scatter.Size = 10;

%%% Patches
Patch.Alpha = .1;

%%% Text
Text.FontName = '';

% Font sizes
Text.LegendSize = 10; % smallest text
Text.AxisSize = 10; % text size of x and y axes numbers and labels
Text.TitleSize = 10; % size of title
Text.IndexSize = 10; % size of number in top left corner, largest possible text


%%% Colormaps
Color.Maps.Linear = parula;
Color.Maps.Monochrome = gray;
Color.Maps.Divergent = turbo;
Color.Maps.Rainbow = hsv;

Color.Steps.Linear = 10;
Color.Steps.Monochrome = 10;
Color.Steps.Divergent = 10;
Color.Steps.Rainbow = 10;


% Legend properties
Colorbar.Location = 'east';


%%% Figure indexing properties
Indexes.Letters = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};
Indexes.Numerals = {'I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX', 'X', 'XI', 'XII', 'XIII', 'XIV', 'XV', 'XVI', 'XVII', 'XVIII', 'XIX', 'XX'};



%%% External

%%% EEGLAB-specific properties
External.EEGLAB.TopoRes = 50; %  image resolution for topoplots
External.EEGLAB.MarkerSize = 2; % size of significant channels


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Correct for chosen format file

% Run selected, so it overwrites whatever it already has
run(PropertyType)



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
PlotProps.External = External;

