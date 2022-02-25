function Axes = subfigure(Space, Grid, CornerLocation, Size, LabelSpace, Letter, PlotProps)
%  subfigure(Space, Grid, Location, Letter, Format)
% Instead of subplot, this lets you place a subfigure anywhere on the
% figure (could be overlap if you're not careful).
% Space is a [left bottom width height] matrix outlining the space within
% to make a grid and place the plot. If empty, uses figure
% Grid indicates the size of the parcel in which the axes should be
% plotted.
% CornerLocation indicates which parcel the bottom left corner of the axes
% should occupy. should be [r x c].
% Size is number of parcels [r x c]. If empty, assumed to be [1 1]
% LabelSpace is true/false, and indicates whether figure should shift for x
% and y labels.
% Letter is optional, and would make a big letter in the corner of the
% parcel.

% if making a sub-sub axes, run the following first:
% Axes = ... {the space you want to fill}
% Axes.Units = 'pixels';
% Space = Axes.Position;
% delete(Axes);
% then run each sub axes with Space filled

PaddingExterior = PlotProps.Figure.Padding;


% if no space provided, use whole figure
set(gcf, 'units', 'pixels')
FigSpace = get(gcf, 'position');
FigSpace = [FigSpace([1, 2]) + PaddingExterior, FigSpace([3, 4]) - PaddingExterior*2];

if isempty(Space)
    Space = FigSpace;
end

if isempty(Size)
    Size = [1 1];
end

if LabelSpace
    PaddingLabels = PlotProps.Axes.labelPadding;
else
    PaddingLabels = 0;
end

% set up padding
xPadding = PlotProps.Axes.xPadding;
yPadding = PlotProps.Axes.yPadding;
FontSize = PlotProps.Text.IndexSize;

% get grid dividers
X = linspace(Space(1), Space(1)+Space(3), Grid(2)+1);
Y = flip(linspace(Space(2), Space(2)+Space(4), Grid(1)+1));

% get axes size
axisWidth = X(2)-X(1);
axisHeight = Y(1)-Y(2);

% get position
Left = X(CornerLocation(2))+xPadding+PaddingLabels;
Bottom = Y(1+CornerLocation(1))+yPadding+PaddingLabels;
Width = axisWidth*Size(2)-xPadding*2-PaddingLabels;
Height = axisHeight*Size(1)-yPadding*2-PaddingLabels;

% set up axes
Position = [Left, Bottom, Width, Height];

%%% Real script
Axes = axes('Units', 'pixels', 'Position', Position);

if ~isempty(Letter)
    Txt = annotation('textbox', [0 0 0 0], 'string', Letter, 'Units', 'pixels', ...
        'FontSize', FontSize, 'FontName', PlotProps.Text.FontName, 'FontWeight', 'Bold');
    Txt.Position =  [X(CornerLocation(2))-FontSize+xPadding, ...
        Y(CornerLocation(1)-Size(1)+1)+FontSize-xPadding/2 0 0];
    Txt.Units = 'normalized';
end


set(gca, 'Units', 'normalized')


%%% Debugging stuff
% % %
% % figure padding
% Box = annotation('rectangle', [0 0 0 0], 'Color', 'red', 'Units', 'pixels');
% Box.Position = FigSpace;
% 
% 
% % Axis padding
% Box = annotation('rectangle', [0 0 0 0], 'Color', 'red', 'Units', 'pixels');
% A = gca;
% A.Units = 'pixels';
% Box.Position = A.Position;