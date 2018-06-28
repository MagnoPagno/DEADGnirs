function move_window(hObject,eventData,hplot,fs)

% Move rectangle in viewer overall plot
%
% Written by Matteo Caffini
% CIMeC - Universita' dgli Studi di Trento
% on June, 27th 2018 in Rovereto (TN)

hrect = findall(hplot.smallaxes, 'Type', 'rectangle');

switch eventData.Source.String
    case '<'
        xmin = hplot.bigaxes1.XLim(1) - 1;
        xmax = hplot.bigaxes1.XLim(2) - 1;
    case '>'
        xmin = hplot.bigaxes1.XLim(1) + 1;
        xmax = hplot.bigaxes1.XLim(2) + 1;
    case '<<'
        xmin = hplot.bigaxes1.XLim(1) - 10;
        xmax = hplot.bigaxes1.XLim(2) - 10;
    case '>>'
        xmin = hplot.bigaxes1.XLim(1) + 10;
        xmax = hplot.bigaxes1.XLim(2) + 10;
end

hrect.Position(1) = xmin;
hplot.bigaxes1.XLim = [xmin xmax];
hplot.bigaxes2.XLim = [xmin xmax]*fs;
hplot.editmin.String = num2str(xmin);
hplot.editmax.String = num2str(xmax);