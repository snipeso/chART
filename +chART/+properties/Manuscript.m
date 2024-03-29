% Formatting for science papers.


%%% Axis positioning
Figure.Padding = 15;
Figure.Width = 21;
Figure.Height = 30;
Figure.Units = 'centimeters';

Axes.xPadding = 15;
Axes.yPadding = Axes.xPadding;
Axes.labelPadding = 15;

%%% Lines
Line.Width = 2;
Line.MarkerSize = 6;
Line.Alpha = .3;

%%% Scatter plot
Scatter.Size = 10;

%%% Patches
Patch.Alpha = .2;


% Font sizes
Text.LegendSize = 7; % smallest text
Text.AxisSize = 9; % text size of x and y axes numbers and labels
Text.TitleSize = 12; % size of title
Text.IndexSize = 15; % size of number in top left corner, largest possible text

%%% Significance stars
SigStar.Shift = .1;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% External

%%% EEGLAB-specific properties
External.EEGLAB.TopoRes = 150; %  image resolution for topoplots
External.EEGLAB.MarkerSize = 1.5; % size of significant channels
External.EEGLAB.Line.Width = .5;



