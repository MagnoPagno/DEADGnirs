function set_time_window_min(~,event,hplot, fs)

xmin = str2double(event.Source.String);
if isnan(xmin)
    xmin = 0;
end
if xmin < hplot.bigaxes1.XLim(2)
    hplot.bigaxes1.XLim(1) = xmin;
    hplot.bigaxes2.XLim(1) = xmin * fs;
    hrect = findall(hplot.smallaxes, 'Type', 'rectangle');
    hrect.Position(3) = hplot.bigaxes1.XLim(2) - xmin;
    hrect.Position(1) = xmin;
else
    msgbox('Invalid value - min must be smaller than max')
end