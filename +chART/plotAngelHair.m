function plotAngelHair(X, Data, Colors, Legend, PlotProps)
% plots good for ERPs and similar average time courses.
% X is a 1 x t array. Data is a P x C x t matrix. Colors is a C x 3 matrix.
% Legend is a 3 x 1 cell array.

Dims = size(Data);
GenericColor = [0.7 0.7 0.7];
IndividualTransparency = 0.3;

if isfield(PlotProps, 'HandleVisibility')
    HV = PlotProps.HandleVisibility;
else
    HV = 'on';
end

% plot individidual's data, color-coded by category
hold on

if size(Colors, 1) == Dims(2) % just plot all individuals and average
    for Indx_C = 1:Dims(2)
        plot(X, squeeze(Data(:, Indx_C, :))', 'LineWidth',PlotProps.Line.Width/3, ...
            'Color', [Colors(Indx_C, :), 0.1], 'HandleVisibility','off')
    end
elseif size(Colors, 1) == Dims(1) && Dims(2)==2 % plot a baseline in one color, and the special event showing individuals

    % plot first group in gray
    plot(X, squeeze(Data(:, 1, :))', 'LineWidth',PlotProps.Line.Width/3, ...
        'Color', [GenericColor IndividualTransparency], 'HandleVisibility','off')


    % second group in color
    for Indx_P = 1:Dims(1)
        plot(X, squeeze(Data(Indx_P, 2, :))', 'LineWidth',PlotProps.Line.Width/3, ...
            'Color', [Colors(Indx_P, :), IndividualTransparency], 'HandleVisibility','off')
    end
    Colors(1, :) = [0.5 0.5 0.5];
    Colors(2, :) = [0 0 0]; % hack, so average is black

elseif  size(Colors, 1) == Dims(1) && Dims(2)>2 % plot last group in colors, the others as averages

     % second group in color
    for Indx_P = 1:Dims(1)
        plot(X, squeeze(Data(Indx_P, Dims(2), :))', 'LineWidth',PlotProps.Line.Width/4, ...
            'Color', [Colors(Indx_P, :), IndividualTransparency], 'HandleVisibility','off')
    end

    Colors(1:Dims(2), :) = flip(chART.utils.color_picker([1 Dims(2)], '', 'black'));
    Colors(Dims(2), :) = [0 0 0];
else
    error('wrong colors')
end

% plot means
if Dims(2)>1
for Indx_C = 1:Dims(2)
    plot(X, squeeze(mean(Data(:, Indx_C, :), 1, 'omitnan'))', 'LineWidth',PlotProps.Line.Width, ...
        'Color', Colors(Indx_C, :), 'HandleVisibility', HV)
end
else

    plot(X, squeeze(mean(Data, 1, 'omitnan'))', 'LineWidth',PlotProps.Line.Width, ...
        'Color', [0 0 0], 'HandleVisibility', HV)
end
axis tight
chART.utils.pad_axis('y', 0.05)

if ~isempty(Legend)
legend(Legend)
end

setAxisProperties(PlotProps)