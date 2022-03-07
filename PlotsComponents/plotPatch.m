function plotPatch(D1, D2, X, Direction, Color, Alpha, LW)
% plots a patch of either the increase or decrease between 2 conditions.
% Data is a 2 x F matrix. Direction is either 'pos' or 'neg'. xLog is true
% or false.


% identify continuous segments of either a positive or negative increase
switch Direction
    case 'pos'
        Patches = (D2-D1) >= 0;
    case 'neg'
        Patches = (D2-D1) <= 0;
    otherwise
        error('invalid direction')
end

[Starts, Ends] = data2windows(Patches);


hold on
plot(X, D1, 'Color', [Color, Alpha], 'LineWidth', LW,  'HandleVisibility', 'off')

for Indx_P = 1:numel(Starts)
    
    x = X(Starts(Indx_P):Ends(Indx_P));
    y1 = D1(Starts(Indx_P):Ends(Indx_P));
    y2 = D2(Starts(Indx_P):Ends(Indx_P));
    
    if Indx_P ==1
        HV = 'on';
    else
        HV = 'off';
    end
%     patch([x fliplr(x)], [y1 fliplr(y2)], Color, 'FaceAlpha',Alpha, ...
%         'EdgeColor', Color, 'EdgeAlpha', Alpha, 'LineWidth', 0.5, 'HandleVisibility', HV)
    
        patch([x fliplr(x)], [y1 fliplr(y2)], Color, 'FaceAlpha',Alpha, ...
            'EdgeColor', 'none', 'HandleVisibility', HV)
    hold off
end

axis tight

