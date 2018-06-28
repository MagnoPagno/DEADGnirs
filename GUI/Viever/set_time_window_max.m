function set_time_window_max(~,event,hplot,fs)

xmax = str2double(event.Source.String);
if xmax > hplot.bigaxes1.XLim(1)
    hplot.bigaxes1.XLim(2) = xmax;
    hplot.bigaxes2.XLim(2) = xmax * fs;
    hrect = findall(hplot.smallaxes, 'Type', 'rectangle');
    hrect.Position(3) = xmax - hrect.Position(1);
else
    msgbox('Invalid value - max must be larger than min')
end