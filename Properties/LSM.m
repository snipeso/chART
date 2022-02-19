% All the possible plot formatting in this script. Not all are needed for
% most figures.


%%% Lines
Line.Alpha = .3;

%%% Patches
Patch.Alpha = .4;

%%% Text
Text.FontName = 'TW Cen MT';


%%% Colormaps
Color.Maps.Linear =  flip(colorcet('L17'));
Color.Maps.Monochrome = colorcet('L2');
Color.Maps.Divergent = colorcet('D1A');
Color.Maps.Rainbow = unirainbow;

Color.Steps.Linear = 20;
Color.Steps.Monochrome = 20;
Color.Steps.Divergent = 28;
Color.Steps.Rainbow = 20;

Color.SigStar = 'k'; % significance stars on top of plots
Color.Generic = [.5 .5 .5];
Color.Background = [1 1 1];

% Legend properties
Colorbar.Location = 'west';


%%% Figure indexing properties
Indexes.Letters = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};
Indexes.Numerals = {'I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX', 'X', 'XI', 'XII', 'XIII', 'XIV', 'XV', 'XVI', 'XVII', 'XVIII', 'XIX', 'XX'};


% task colors
AllTasks = {'Match2Sample', 'LAT', 'PVT', 'SpFT', 'Game', 'Music'};
Color.AllTasks = getColors(6, 'rainbow');
for Indx_T = 1:numel(AllTasks)
    Color.Tasks.(AllTasks{Indx_T}) = Color.AllTasks(Indx_T, :);
end

% colors for levels in M2S task
Color.Levels = flip(getColors([1 3], 'rainbow', 'red')); % M2S red
Color.spEpochs = getColors([1 2], 'rainbow', 'green'); % speech green

% other colors
Color.Participants = reduxColormap(Color.Maps.Rainbow, 18);

% colors + shades for all the tasks
Color.Sessions = getColors([numel(AllTasks), 3], 'rainbow');



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Statistics Limits
Stats.Alpha = .05;
Stats.Trend = .1;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% External

%%% EEGLAB-specific properties
External.EEGLAB.TopoRes = 50; %  image resolution for topoplots
External.EEGLAB.MarkerSize = 2; % size of significant channels




