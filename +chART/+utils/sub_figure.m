function Space = subaxis(Grid, CornerLocation, Size, Letter, PlotProps, OldSpace)
% mini script for setting up a sub-axis and getting coordinates. This is
% just the empty space to put anther chART.utils.sub_plot

if ~exist('OldSpace', 'var') || isempty(OldSpace)
OldSpace = [];
end

Axis = chART.utils.sub_plot(OldSpace, Grid, CornerLocation, Size, false, Letter, PlotProps);
Axis.Units = 'pixels';
Space = Axis.Position;
axis off

Axis.Units = 'normalized';

