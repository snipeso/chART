function plotAngelHair(X, Data, Colors, Legend, PlotProps)
% plots good for ERPs and similar average time courses.
% X is a 1 x t array. Data is a P x C x t matrix. Colors is a C x 3 matrix.
% Legend is a 3 x 1 cell array.

Dims = size(Data);
GenericColor = [0.7 0.7 0.7];
IndividualTransparency = 0.3;

% plot individidual's data, color-coded by category
hold on

if size(Colors, 1) == Dims(2)
    for Indx_C = 1:Dims(2)
        plot(X, squeeze(Data(:, Indx_C, :))', 'LineWidth',PlotProps.Line.Width/3, ...
            'Color', [Colors(Indx_C, :), 0.1], 'HandleVisibility','off')
    end
elseif size(Colors, 1) == Dims(1) && Dims(2)==2

    % plot first group in gray
    plot(X, squeeze(Data(:, 1, :))', 'LineWidth',PlotProps.Line.Width/3, ...
        'Color', [GenericColor IndividualTransparency], 'HandleVisibility','off')


    % second group in color
    for Indx_P = 1:Dims(1)
        plot(X, squeeze(Data(Indx_P, 2, :))', 'LineWidth',PlotProps.Line.Width/3, ...
            'Color', [Colors(Indx_P, :), IndividualTransparency], 'HandleVisibility','off')
    end
    Colors(1, :) = GenericColor;
    Colors(2, :) = [0 0 0]; % hack, so average is black
else
    error('wrong colors')
end

% plot means
for Indx_C = 1:Dims(2)
    plot(X, squeeze(mean(Data(:, Indx_C, :), 1, 'omitnan'))', 'LineWidth',PlotProps.Line.Width, ...
        'Color', Colors(Indx_C, :), 'HandleVisibility','on')
end
axis tight
padAxis('y', 0.05)

legend(Legend)
set(gca, 'FontSize', PlotProps.Text.AxisSize, 'FontName', PlotProps.Text.FontName)