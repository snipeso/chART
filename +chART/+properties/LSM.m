% All the possible plot formatting in this script. Not all are needed for
% most figures.


%%% Lines
Line.Alpha = .3;

%%% Patches
Patch.Alpha = .2;

%%% Text
Text.FontName = 'TW Cen MT';


%%% Colormaps
Color.Maps.Linear =  flip(colorcet('L17'));
Color.Maps.Monochrome = colorcet('L2');
Color.Maps.Divergent = colorcet('D1A');
Color.Maps.Rainbow = chART.utils.chART.utils.rainbow;
% Color.Maps.Rainbow = colorcet('R2');

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
Color.AllTasks = chART.utils.color_picker(6, 'rainbow');
for Indx_T = 1:numel(AllTasks)
    Color.Tasks.(AllTasks{Indx_T}) = Color.AllTasks(Indx_T, :);
end

% colors for levels in M2S task
Color.Levels = flip(chART.utils.color_picker([1 3], 'rainbow', 'red')); % M2S red
Color.spEpochs = chART.utils.color_picker([1 2], 'rainbow', 'green'); % speech green

% colors + shades for all the tasks
Color.Sessions = chART.utils.color_picker([numel(AllTasks), 3], 'rainbow');

% Participants colors
Color.Participants = [
    217, 61 61;
    218 94 60;
    216, 121,62;
    215, 150, 63;
    215, 175, 62;
    200, 196, 42;
    160, 200, 38;
    121, 183, 39;
    23, 161, 36;
    39, 187, 95;
    48, 182, 147;
    30, 173, 192;
    56, 158, 228;
    90, 123, 228;
    122, 97, 229;
    155, 106, 220;
    229, 105, 179;
    225, 77, 140
    ]/255;
% Color.Participants = chART.utils.resize_colormap(Color.Maps.Rainbow, 18);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Statistics Limits
Stats.Alpha = .05;
Stats.Trend = .1;
Stats.PlotN = false;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% External

%%% EEGLAB-specific properties
External.EEGLAB.TopoRes = 50; %  image resolution for topoplots
External.EEGLAB.MarkerSize = 2; % size of significant channels




