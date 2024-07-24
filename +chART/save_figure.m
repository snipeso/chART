function save_figure(Title, Destination, PlotProps)
arguments
    Title
    Destination = cd;
    PlotProps = chART.load_plot_properties();
end
% little script for saving figures, so I can change things all together if
% I want. Based on the extention of Title, it will make that figure.
% Currently supports: PNG, SVG, PDF. If nothing is provided it will do all
% of them.

Extention = extractAfter(Title, '.');

if isempty(Extention)
    doSVG = true;
    doPDF = true;
    doTIFF = true;
    doPNG = false;
elseif strcmpi(Extention, 'pdf')
    doSVG = true;
    doPDF = true;
    doTIFF = false;
    doPNG = true;
elseif strcmpi(Extention, 'svg')
    doSVG = true;
    doPDF = false;
    doTIFF = false;
    doPNG = true;

    elseif strcmpi(Extention, 'png')
    doSVG = false;
    doPDF = false;
    doTIFF = false;
    doPNG = true;
else
    doSVG = false;
    doPDF = false;
    doTIFF = false;
    doPNG = true;
    warning("Don't know this option, saving png")

end

set(gcf, 'InvertHardcopy', 'off', 'Color', PlotProps.Color.Background)

if doSVG
    % save svg
    svgFile = fullfile(Destination, [Title, '.svg']);
    print(gcf,  svgFile, '-dsvg', '-r1000')

    % Replace color-interpolation from linearRGB to sRGB
    fileText = fileread(svgFile);
    fileText = strrep(fileText, 'color-interpolation:linearRGB;', 'color-interpolation:sRGB;');
    fileText = strrep(fileText, 'color-interpolation:auto;', 'color-interpolation:sRGB;');

    % Write the modified content back to the SVG file
    fid = fopen(svgFile, 'w');
    fwrite(fid, fileText);
    fclose(fid);
end

if doPDF
    command = strcat('"C:\Program Files\Inkscape\bin\inkscape.exe" ', {' '}, '"', fullfile(Destination, Title),...
        '.svg" --export-filename="', fullfile(Destination, Title), '.pdf"');
    [ status, msg ] = system(command{1}); % Run command prompt - return variable to suppress output text
    disp(msg)
end

if doTIFF
    print(fullfile(Destination, Title), '-dtiff', '-r1000')
end

if doPNG
    svgFile = fullfile(Destination, [Title, '.png']);
    saveas(gcf, svgFile);
end