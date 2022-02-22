function  plotBalloonBrain(Maps, Orientation, CLims, plotPatch, PlotProps)
% plotBalloonBrain(Maps, Orientation, CLims, plotPatch, PlotProps)
%
% Function for plotting inflated brain half. Requires FieldTrip.
% Maps is a structure with field "left" and "right", containing data from
% that half.
% Orientation is either: 'left-inside', 'left-outside', 'right-inside', or
% 'right-outside'.
% CLims is the value limits for the colormap.
% plotPatch is a boolean, on whether to plot a covering patch for deep
% brain structures.

Axis = gca;
OldPosition = Axis.Position;

cfg = [];
cfg.method         = 'surface';
cfg.funparameter   = 'stat';
cfg.projmethod     = 'nearest';
cfg.funcolorlim    = CLims;
cfg.funcolormap    = reduxColormap(PlotProps.Color.Maps.Divergent, PlotProps.Color.Steps.Divergent);
% cfg.opacitylim     = [0 0.2];
cfg.opacitymap     = 'rampup';
cfg.maskparameter  = 'mask';
cfg.colorbar       = 'no';

Focus1 = [56 -23];
Focus2 = [-56 8];
PatchColor = [225, 221 192]/255;
PatchAlpha = .75;
Eccentricity = .75;

if contains(Orientation, 'left')
    cfg.surffile = 'surface_white_left.mat'; % if put inflated here it does not project correct
    cfg.surfinflated = 'surface_inflated_left.mat';
    
elseif contains(Orientation, 'right')
    cfg.surffile = 'surface_white_right.mat'; % if put inflated here it does not project correct
    cfg.surfinflated = 'surface_inflated_right.mat';
end


switch Orientation
    case 'left-inside'
        ft_sourceplot_hemisphere(cfg, Maps.left);
        view(90,0)
        if plotPatch
            hold on
            plotOval(Focus1, Focus2, Eccentricity, 'x', PatchColor, PatchAlpha)
        end
        
    case 'left-outside'        
        ft_sourceplot_hemisphere(cfg, Maps.left);
        view(-90,0)
        
    case 'right-inside'
        
        ft_sourceplot_hemisphere(cfg, Maps.right);
        view(-90,0)
        
        if plotPatch
            hold on
            plotOval(Focus1, Focus2, Eccentricity, 'x', PatchColor, PatchAlpha)
        end
        
    case 'right-outside'
       ft_sourceplot_hemisphere(cfg, Maps.right);
        view(90,0)
end

lighting none
axis tight
padAxis('x', .75)

set(gca, 'Position', OldPosition)
