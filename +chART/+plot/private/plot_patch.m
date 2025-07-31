function plot_patch(D1, D2, X, Direction, Color, Alpha, LW, HV)
% plots a patch of either the increase or decrease between 2 conditions.
% Data is a 2 x F matrix. Direction is either 'pos' or 'neg'. xLog is true
% or false.


% identify continuous segments of either a positive or negative increase
switch Direction
    case 'pos'
        Patches = (D2-D1) >= 0;
        [Starts, Ends] = data2windows(Patches);
    case 'neg'
        Patches = (D2-D1) <= 0;
        [Starts, Ends] = data2windows(Patches);
    otherwise
        Patches = (D2-D1) >= 0;
        [Starts, Ends] = data2windows(Patches);


        Patches = (D2-D1) <= 0;
        [StartsNeg, EndsNeg] = data2windows(Patches);

        Starts = [Starts, StartsNeg];
        Ends = [Ends, EndsNeg];
        % error('invalid direction')
end


hold on
plot(X, D1, 'Color', [Color, Alpha], 'LineWidth', LW,  'HandleVisibility', 'off')

for Indx_P = 1:numel(Starts)

    x = X(Starts(Indx_P):Ends(Indx_P));
    y1 = D1(Starts(Indx_P):Ends(Indx_P));
    y2 = D2(Starts(Indx_P):Ends(Indx_P));

    if Indx_P ==1
        HV_2 = HV;
    else
        HV_2 = 'off';
    end
    patch([x fliplr(x)], [y1 fliplr(y2)], Color, 'FaceAlpha',Alpha, ...
        'EdgeColor', 'none', 'HandleVisibility', HV_2)
end
hold off

axis tight

