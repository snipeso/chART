function plotBubbles(Data, Coordinates, Type, Size, Labels, PlotProps)
% plotBubbleTopo(Data, Chanlocs, Type, Size, Labels, PlotProps)
%
% Script for plotting Data (P x N) as color of circles of a given size and color in
% specified coordinates. Developed primarily for plotting EEG channels.
% Coordinates is a 1 x N struct that should contain:
% - theta (rad only)
% - radius (rad only)
% - X (cart only)
% - Y (cart only)
% - Z (cart only)
% - labels
% Type is a string either 'rad' (radial coordinates) or 'cart' (cartesian).
% The radial coordinates are plotted in 2D.
% Size can be either a single number, or a N x 1 array.
% Labels is optional, N x 1 character array and can contain specific labels to plot.

TextColor = [.75 .75 .75];

switch Type
    case 'rad'

        % calculate coordinates
        Theta =[Coordinates.theta];
        Radius = [Coordinates.radius];
        
        Theta = -pi/180*(Theta-90);
        [x, y] = pol2cart(Theta, Radius);
        
        % plot
                    hold on
        scatter(x, y, Size, Data, 'filled')
        
        % add text labels
        if ~isempty(Labels)
            if numel(Labels) == numel(Coordinates) % if asking for all of them, plot all of them
                  textscatter(x, y, Labels, 'ColorData', TextColor, 'FontName', ...
                      PlotProps.Text.FontName, 'TextDensityPercentage', 100)
                  
            else % otherwise let the computer chose which to plot
                textscatter(x, y, {Coordinates.labels}, 'ColorData', TextColor, ...
                    'FontName', PlotProps.Text.FontName)
            end
        end
        
        % cleanup axes
        axis square
        xlim([min(x) max(x)])
        ylim([min(y) max(y)])
        padAxis('x')
        padAxis('y')
        
    case 'cart'
        
        % get coordinates
        X = [Coordinates.X];
        Y = [Coordinates.Y];
        Z = [Coordinates.Z];
        
        % plot
        scatter3(X, Y, Z, Size, Data, 'filled')
        
        % add text labels
        if  ~isempty(Labels)
            hold on
            textscatter3(X, Y, Z, {Coordinates.labels}, 'ColorData', TextColor, ...
                'FontName', PlotProps.Text.FontName)
        end
        
        % cleanup axes
        view(0, 90)
        axis vis3d
        set(gca,'DataAspectRatio',[1 1 1.2])
end

set(gca, 'visible', 'off', 'FontName', PlotProps.Text.FontName, ...
    'FontSize', PlotProps.Text.AxisSize)
title('')

set(findall(gca, 'type', 'text'), 'visible', 'on')

Dims = size(Data);

if Dims(2) ~=3 % if not a color triplet
    Colormap = PlotProps.Color.Maps.Linear;
    Colormap = reduxColormap(Colormap, PlotProps.Color.Steps.Linear);
    colormap(Colormap)
    colorbar
end