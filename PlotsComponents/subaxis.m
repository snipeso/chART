function Space = subaxis(Grid, CornerLocation, Size, Letter, PlotProps)
% mini script for setting up a sub-axis and getting coordinates. This is
% just the empty space to put anther subfigure

Axis = subfigure([], Grid, CornerLocation, Size, false, Letter, PlotProps);
Axis.Units = 'pixels';
Space = Axis.Position;
axis off

Axis.Units = 'normalized';

