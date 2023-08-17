function Symbol = chART.utils.significance_symbol(P)
% identify symbol to plot for significance stars. P is a p value.

if P < .1 && P > .05
    Symbol = ' ';
elseif P <= .05 && P > .01
    Symbol = '*';
elseif P <= .01 && P > .001
    Symbol = '**';
elseif P <= .001
    Symbol = '***';
else
    Symbol = '';
end