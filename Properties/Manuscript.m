% Formatting for science papers.


%%% Axis positioning
Figure.Padding = 40;
Figure.Width = 42;
Figure.Height = 60;
Figure.Units = 'centimeters';

Axes.xPadding = 25;
Axes.yPadding = Axes.xPadding;


%%% Lines
Line.Width = 3;
Line.MarkerSize = 10;
Line.Alpha = .3;

%%% Scatter plot
Scatter.Size = 100;

%%% Patches
Patch.Alpha = .4;

%%% Text
Text.FontName = 'Tw Cen MT';

% Font sizes
Text.LegendSize = 15; % smallest text
Text.AxisSize = 18; % text size of x and y axes numbers and labels
Text.TitleSize = 22; % size of title
Text.IndexSize = 30; % size of number in top left corner, largest possible text


%%% Colormaps
Color.Maps.Linear =  flip(colorcet('L17'));
Color.Maps.Monochrome = colorcet('L2');
Color.Maps.Divergent =  colorcet('D1A');
Color.Maps.Rainbow = unirainbow;

Color.Steps.Linear = 20;
Color.Steps.Monochrome = 20;
Color.Steps.Divergent = 28;
Color.Steps.Rainbow = 20;


% Legend properties
Colorbar.Location = 'west';


%%% Figure indexing properties
Indexes.Letters = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};
Indexes.Numerals = {'I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX', 'X', 'XI', 'XII', 'XIII', 'XIV', 'XV', 'XVI', 'XVII', 'XVIII', 'XIX', 'XX'};



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% External

%%% EEGLAB-specific properties
External.EEGLAB.TopoRes = 300; %  image resolution for topoplots
External.EEGLAB.MarkerSize = 5; % size of significant channels




