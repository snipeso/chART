function plotFlames(DataStruct, Colors, Alpha, PlotProps)
% plots overlapping translucent external.violin plots.
% DataStruct is a recursive structure, where the first set of fields holds
% data for each x mark, and the second subset holds all the values that
% need to be distributed.

xLabels = fieldnames(DataStruct);

hold on

Legend = {};

for Indx_X = 1:numel(xLabels)
    Patches = fieldnames(DataStruct.(xLabels{Indx_X}));
    Legend = cat(1, Legend, Patches);

    for Indx_P = 1:numel(Patches)
        D = DataStruct.(xLabels{Indx_X}).(Patches{Indx_P});
        D(isnan(D)) = [];

        if isempty(D)
            continue
        end

        if numel(size(Colors)) ==3
        Color = squeeze(Colors(Indx_P,  :, Indx_X));
        else
            Color = Colors(Indx_P,  :);
        end

        external.violin(D(:), 'x', [Indx_X, 0], 'facecolor', Color, 'edgecolor', 'none', ...
            'facealpha', Alpha, 'mc', [], 'medc', []);
        %NB: error might be because array is not in correct orientation
    end
end

Legend = unique(Patches); % TODO: fix when it stops working
legend(Legend)

xlim([.5, Indx_X+.5])
xticks(1:Indx_X)



    xticklabels(xLabels)


box off
chART.set_axis_properties(PlotProps)