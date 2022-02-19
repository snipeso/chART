% All the possible plot formatting in this script. Not all are needed for
% most figures.

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
Text.FontName = 'TW Cen MT';

% Font sizes
Text.LegendSize = 10; % smallest text
Text.AxisSize = 10; % text size of x and y axes numbers and labels
Text.TitleSize = 10; % size of title
Text.IndexSize = 10; % size of number in top left corner, largest possible text


%%% Colormaps
Color.Maps.Linear =  flip(colorcet('L17'));
Color.Maps.Monochrome = colorcet('L2');
Color.Maps.Divergent = colorcet('D1A');
Color.Maps.Rainbow = unirainbow;

Color.Steps.Linear = 20;
Color.Steps.Monochrome = 20;
Color.Steps.Divergent = 20;
Color.Steps.Rainbow = 20;

Color.SigStar = 'k'; % sinificance stars on top of plots
Color.Generic = [.5 .5 .5];
Color.Background = [1 1 1];

% Legend properties
Colorbar.Location = 'east';


%%% Figure indexing properties
Indexes.Letters = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};
Indexes.Numerals = {'I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX', 'X', 'XI', 'XII', 'XIII', 'XIV', 'XV', 'XVI', 'XVII', 'XVIII', 'XIX', 'XX'};


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Statistics Limits
Stats.Alpha = .05;
Stats.Trend = .1;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% External

%%% EEGLAB-specific properties
External.EEGLAB.TopoRes = 50; %  image resolution for topoplots
External.EEGLAB.MarkerSize = 2; % size of significant channels




