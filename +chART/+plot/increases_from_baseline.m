function increases_from_baseline(Baseline, Data,  XAxisData, Direction, plotMean, PlotProps, Colors)
arguments
    Baseline
    Data
    XAxisData
    Direction = 'pos';
    plotMean = true;
    PlotProps = chART.load_plot_properties();
    Colors = chART.utils.resize_colormap(PlotProps.Color.Maps.Rainbow, size(Baseline, 1));
end
% plot for highlighting how data increases from one set to another.
% For every row in Baseline(P x F) and Data, plots a line for Data1 and a patch
% representing the increase in Data2 relative to Data1. Then it plots a
% patch for the averages of Baseline and Data. XAxisData should be as many
% elements are there are columns in Data. Colors should be a P x 3 matrix
% of RGB values from 0 to 1. Direction should be either 'pos' or 'neg', but
% default is 'pos'.

if isfield(PlotProps, 'HandleVisibility')
    HandleVisibility = PlotProps.HandleVisibility;
else
    HandleVisibility = 'on';
end

Dims = size(Baseline);

if Dims(2)==1
    Baseline = Baseline';
    Data = Data';
    Dims = Dims';
end

for Indx_P = 1:Dims(1)
    if Indx_P > 1
        HV = 'off';
    else
        HV = HandleVisibility;
    end

    BL = Baseline(Indx_P, :);
    D = Data(Indx_P, :);
    if all(isnan(BL))
        Data(Indx_P, :) = nan;
    elseif all(isnan(D))
        BL(Indx_P, :) = nan;
    end

    hold on
    plot_patch(BL, D, XAxisData, Direction, Colors(Indx_P, :), ...
        PlotProps.Patch.Alpha, PlotProps.Line.Width/4, HV) % little numbers are alpha and linewidth
end

% plot mean
if Dims(1)~=1 && plotMean
    Baseline = mean(Baseline, 1, 'omitnan');
    Data = mean(Data, 1, 'omitnan');
    plot_patch(Baseline, Data, XAxisData, Direction, 'k', .4, PlotProps.Line.Width/2, 'on')
end

chART.set_axis_properties(PlotProps)