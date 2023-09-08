function highlighted_segments(Data, CI, X, CI_Distance, Highlights, Colors, PlotProps)
% Plots lines, highlighting specific segments. Used to show statistically
% significant differences from baseline in power spectrum data.
% Data is an S x F matrix. Each S is a line.
% X is 1 x F array.
% CI is a 2 x S x F
% Highlights is a S x F matrix of 1s and 0s; such that 1s will be
% highlighted.
% Colors is S x 3 colors in RGB.

Dims = size(Data);

PaleColors = chART.utils.pale_colors(Colors, .4);

X_Jumps = 1:CI_Distance:Dims(2);

% plot the little legs of the caterpillar
hold on
for Indx_S = 1:Dims(1)

    X_temp = X_Jumps((Indx_S):(Dims(1)):numel(X_Jumps));
    X_points = X(X_temp);
    D =  squeeze(Data(Indx_S, X_temp));
    pos = squeeze(CI(2, Indx_S, X_temp))' - D;
    neg = D - squeeze(CI(1, Indx_S, X_temp))';


    errorbar(X_points, D,  neg, pos,...
        'Color', [PaleColors(Indx_S, :)], 'CapSize', 0, ...
        'LineWidth', PlotProps.Line.Width/2, 'HandleVisibility', 'off');
end


% plot thin lines of data
for Indx_S = 1:Dims(1)
    plot(X, Data(Indx_S, :), 'Color', Colors(Indx_S, :), ...
        'LineWidth', PlotProps.Line.Width, 'HandleVisibility', 'on')

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
        'Color', [Colors(Indx_S, :)], ...
        'LineWidth', PlotProps.Line.Width*3, 'HandleVisibility', HV)
end

chART.set_axis_properties(PlotProps)