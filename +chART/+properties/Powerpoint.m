% Formatting for PowerPoint presentations

%%% Axis positioning
Figure.Padding = 40;
Figure.Width = 71;
Figure.Height = 39.9;
Figure.Units = 'centimeters';

Axes.xPadding = 25;
Axes.yPadding = Axes.xPadding;


%%% Lines
Line.Width = 5;
Line.MarkerSize = 20;
Line.Alpha = .3;

%%% Scatter plot
Scatter.Size = 100;

%%% Patches
Patch.Alpha = .4;

%%% Text
Text.FontName = 'Tw Cen MT';

% Font sizes
Text.LegendSize = 20; % smallest text
Text.AxisSize = 25; % text size of x and y axes numbers and labels
Text.TitleSize = 30; % size of title
Text.IndexSize = 30; % size of number in top left corner, largest possible text


%%% Colormaps
Color.Maps.Linear =  flip(chART.external.colorcet('L17'));
Color.Maps.Monochrome = chART.external.colorcet('L2');
Color.Maps.Divergent =  chART.external.colorcet('D1A');
Color.Maps.Rainbow = chART.utils.rainbow;

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
External.EEGLAB.TopoRes = 500; %  image resolution for topoplots
External.EEGLAB.MarkerSize = 5; % size of significant channels




