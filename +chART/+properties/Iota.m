% All the possible plot formatting in this script. Not all are needed for
% most figures.

Scatter.Size = 10;
Scatter.Alpha = .6;

%%% Lines
Line.Alpha = .3;

%%% Patches
Patch.Alpha = .2;

%%% Text
Text.FontName = 'Noto sans';
Text.TitleSize = 11;

%%% Colormaps
Color.Maps.Linear =  flip(chART.external.colorcet('L17'));
Color.Maps.Monochrome = chART.external.colorcet('L2');
Color.Maps.Divergent = chART.external.colorcet('D1A');
Color.Maps.Rainbow = chART.utils.rainbow;
% Color.Maps.Rainbow = colorcet('R2');

Color.Steps.Linear = 200;
Color.Steps.Monochrome = 20;
Color.Steps.Divergent = 30;
Color.Steps.Rainbow = 20;

Color.SigStar = 'k'; % significance stars on top of plots
Color.Generic = [.5 .5 .5];
Color.Background = [1 1 1];

% Legend properties
Colorbar.Location = 'west';


%%% Figure indexing properties
Indexes.Letters = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};
Indexes.Numerals = {'I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX', 'X', 'XI', 'XII', 'XIII', 'XIV', 'XV', 'XVI', 'XVII', 'XVIII', 'XIX', 'XX'};

% Figure dimentions
Figure.Width = 23;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Statistics Limits
Stats.Alpha = .05;
Stats.Trend = .1;
Stats.PlotN = false;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% External

%%% EEGLAB-specific properties
External.EEGLAB.MarkerSize = 2; % size of significant channels




