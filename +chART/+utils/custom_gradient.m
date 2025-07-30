function colormap = custom_gradient(color1, color2, n)
arguments
color1
color2 = [1 1 1];
n = 256
end

colormap = [linspace(color1(1), color2(1), n)', ...
            linspace(color1(2), color2(2), n)', ...
            linspace(color1(3), color2(3), n)'];