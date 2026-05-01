function Space = sub_figure(Grid, CornerLocation, Size, Letter, PlotProps, OldAxes, LabelSpace)
% NOTE: switched previous "subfigure" to sub_plot; subaxis is now this
% mini script for setting up a sub-axis and getting coordinates. This is
% just the empty space to put anther chART.sub_plot

if ~exist('OldAxes', 'var') || isempty(OldAxes)
    OldSpace = [];
else
    OldAxes.Units = 'pixels';
    OldSpace = OldAxes.Position;
    OldAxes.Visible = 'off';
end


if ~exist('LabelSpace', 'var')
    LabelSpace = false;
end

Axis = chART.sub_plot(OldSpace, Grid, CornerLocation, Size, LabelSpace, Letter, PlotProps);
Axis.Units = 'pixels';
Space = Axis.Position;

Axis.Units = 'normalized';

