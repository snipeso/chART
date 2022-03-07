function plotGloWorms(Data, X, Highlights, Colors, PlotProps)
% Plots lines, highlighting specific segments. Used to show statistically
% significant differences from baseline in power spectrum data.
% Data is an S x F matrix. Each S is a line.
% X is 1 x F array.
% Highlights is a S x F matrix of 1s and 0s; such that 1s will be
% highlighted.
% Colors is S x 3 colors in RGB.

Dims = size(Data);

% plot thin lines of data
hold on
for Indx_S = 1:Dims(1)
    plot(X, Data(Indx_S, :), 'Color', Colors(Indx_S, :), ...
        'LineWidth', PlotProps.Line.Width/2, 'HandleVisibility', 'on')
    
    if Indx_S==Dims(1) % visibility of glow
        HV = 'on';
    else
        HV = 'off';
    end
    
    XH = nan(size(X));
    YH = XH;
    
    XH(Highlights(Indx_S, :)) = X(Highlights(Indx_S, :));
    YH(Highlights(Indx_S, :)) = Data(Indx_S, Highlights(Indx_S, :));
    
    plot(XH, YH, ...
         'Color', [Colors(Indx_S, :), .65], ...
         'LineWidth', PlotProps.Line.Width*2, 'HandleVisibility', HV)
end

set(gca, 'FontName', PlotProps.Text.FontName, 'FontSize', PlotProps.Text.AxisSize)