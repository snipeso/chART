function pad_axis(Axis, Prcnt)
% chART.utils.pad_axis(Axis, Prcnt)
%
% adds a little padding to current axis as a percentage of whatever it is.
% Axis is a string ('x', 'y', 'c')
% Prcnt is a number from 0 to 1.

switch Axis
    case 'x'
        Lims = xlim;
    case 'y'
        Lims = ylim;
    case 'c'
        Lims = caxis;
end

Range = diff(Lims);

if exist('Prcnt','var')
Padding = Range*Prcnt;
else
Padding = Range*.05;
end
NewLims = [Lims(1)-Padding, Lims(2)+Padding];


switch Axis
    case 'x'
        xlim(NewLims)
    case 'y'
        ylim(NewLims)
    case 'c'
        caxis(NewLims)
end

