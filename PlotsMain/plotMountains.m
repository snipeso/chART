function plotMountains(Data1, Data2,  X, Direction, Colors, PlotProps)
% Plots P overlapping patches that represent an increase between two
% conditions, and the average.
% Data are P x F matrices, where most of Data2 should be larger than Data1.
% Direction should be either 'pos' or 'neg'

if isfield(PlotProps, 'HandleVisibility')
    HandleVisibility = PlotProps.HandleVisibility;
else
    HandleVisibility = 'on';
end

Dims = size(Data1);

for Indx_P = 1:Dims(1)
    if Indx_P > 1
        HV = 'off';
    else
        HV = HandleVisibility;
    end
    
    hold on
    plotPatch(Data1(Indx_P, :), Data2(Indx_P, :), X, Direction, Colors(Indx_P, :), ...
        PlotProps.Patch.Alpha, PlotProps.Line.Width/4, HV) % little numbers are alpha and linewidth
end

% plot mean
Data1 = nanmean(Data1, 1);
Data2 = nanmean(Data2, 1);
plotPatch(Data1, Data2, X, Direction, 'k', .4, PlotProps.Line.Width/2, 'on')